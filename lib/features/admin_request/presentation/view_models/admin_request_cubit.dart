import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:por2/features/admin_request/domain/usecases/submit_admin_request_use_case.dart';
import 'package:por2/features/admin_request/presentation/view_models/admin_request_state.dart';

@injectable
class AdminRequestCubit extends Cubit<AdminRequestState> {
  final SubmitAdminRequestUseCase _submitAdminRequestUseCase;

  AdminRequestCubit(
    this._submitAdminRequestUseCase,
  ) : super(AdminRequestInitial());

  Future<void> submitRequest(String imageUrl) async {
    emit(AdminRequestLoading());
    try {
      await _submitAdminRequestUseCase(imageUrl);
      emit(AdminRequestSuccess());
    } catch (e) {
      emit(AdminRequestError("حدث خطأ أثناء إرسال الطلب، يرجى المحاولة مرة أخرى."));
    }
  }
}
