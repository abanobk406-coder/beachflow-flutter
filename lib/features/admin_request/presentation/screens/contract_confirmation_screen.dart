import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:por2/config/di.dart';
import 'package:por2/features/admin_request/presentation/screens/admin_request_success_screen.dart';
import 'package:por2/features/admin_request/presentation/view_models/admin_request_cubit.dart';
import 'package:por2/features/admin_request/presentation/view_models/admin_request_state.dart';

class ContractConfirmationScreen extends StatefulWidget {
  final String imageUrl;
  const ContractConfirmationScreen({super.key, required this.imageUrl});

  @override
  State<ContractConfirmationScreen> createState() =>
      _ContractConfirmationScreenState();
}

class _ContractConfirmationScreenState
    extends State<ContractConfirmationScreen> {
  bool _isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AdminRequestCubit>(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text(
              'شروط وأحكام',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            centerTitle: true,
          ),
          body: BlocConsumer<AdminRequestCubit, AdminRequestState>(
            listener: (context, state) {
              if (state is AdminRequestSuccess) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AdminRequestSuccessScreen(),
                  ),
                );
              } else if (state is AdminRequestError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              final isSubmitting = state is AdminRequestLoading;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    // Document Icon Card
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'عقد بيتش فلو - Beach Flow',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.description_outlined,
                      color: Colors.blue.shade400,
                      size: 28,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // Agreement Checkbox Row
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isAccepted = !_isAccepted;
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _isAccepted
                              ? Colors.blue
                              : Colors.grey.shade400,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(6),
                        color: _isAccepted ? Colors.blue : Colors.transparent,
                      ),
                      child: _isAccepted
                          ? const Icon(
                              Icons.check,
                              size: 18,
                              color: Colors.white,
                            )
                          : null,
                    ),
                    const SizedBox(width: 15),
                    const Expanded(
                      child: Text(
                        'أوافق على جميع شروط وأحكام عقد بيتش فلو (Beach Flow) وألتزم بتنفيذها.',
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.5,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // Confirm Button
              SizedBox(
                width: double.infinity,
                height: 55,
                // margin: const EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                  onPressed: (!_isAccepted || isSubmitting)
                      ? null
                      : () => context.read<AdminRequestCubit>().submitRequest(widget.imageUrl),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade50,
                    foregroundColor: Colors.blue,
                    disabledBackgroundColor: Colors.grey.shade100,
                    disabledForegroundColor: Colors.grey.shade400,
                    elevation: 0,
                    side: BorderSide(
                      color: (!_isAccepted || isSubmitting)
                          ? Colors.transparent
                          : Colors.blue.shade100,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: isSubmitting
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.blue,
                          ),
                        )
                      : const Text(
                          'تأكيد وإرسال الطلب',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ); // End Padding
      }, // End builder
    ), // End BlocConsumer
  ), // End Scaffold
), // End Directionality
); // End BlocProvider
}
}

