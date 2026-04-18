import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:por2/features/profile/presentation/cubit/profile_states.dart';
import 'package:por2/features/profile/presentation/cubit/profile_view_model.dart';
import 'package:por2/shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? _imageBase64;
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadLocalImage();
  }

  Future<void> _loadLocalImage() async {
    final prefs = await SharedPreferencesUtils.getPreferences();
    setState(() {
      _imageBase64 = prefs.getString('imageBase64');
    });
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
      imageQuality: 70,
    );
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      final base64String = base64Encode(bytes);
      setState(() {
        _imageBase64 = base64String;
      });
      final prefs = await SharedPreferencesUtils.getPreferences();
      await prefs.setString('imageBase64', base64String);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<ProfileViewModel>()..getProfile(),
      child: Scaffold(
        appBar: AppBar(title: const Text('الإعدادات')),
        body: BlocConsumer<ProfileViewModel, ProfileStates>(
          listener: (context, state) {
            if (state is ProfileUpdateSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم تحديث البيانات بنجاح')),
              );
              Navigator.pop(context, true);
            } else if (state is ProfileUpdateErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            } else if (state is ProfileSuccessState) {
              _nameController.text = state.user.name ?? '';
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade200,
                      ),
                      child: ClipOval(
                        child: _imageBase64 != null
                            ? Image.memory(base64Decode(_imageBase64!), fit: BoxFit.cover)
                            : (state is ProfileSuccessState && state.user.profilePic != null)
                                ? Image.network(
                                    state.user.profilePic!,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) =>
                                        const Icon(Icons.person, size: 50, color: Colors.grey),
                                  )
                                : const Icon(Icons.person, size: 50, color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'الاسم'),
                  ),
                  const SizedBox(height: 10),
                  state is ProfileUpdateLoadingState
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            if (_nameController.text.isNotEmpty) {
                              context.read<ProfileViewModel>().updateProfile(_nameController.text);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('يرجى إدخال الاسم')),
                              );
                            }
                          },
                          child: const Text('حفظ التغييرات'),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

