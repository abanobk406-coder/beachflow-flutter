abstract class AdminRequestState {}

class AdminRequestInitial extends AdminRequestState {}

class AdminRequestLoading extends AdminRequestState {}

class AdminRequestSuccess extends AdminRequestState {}

class AdminRequestError extends AdminRequestState {
  final String message;

  AdminRequestError(this.message);
}
