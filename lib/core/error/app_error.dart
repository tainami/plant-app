sealed class AppError {
  final String? message;

  AppError(this.message);
}

class DomainError extends AppError {
  DomainError(super.message);
}

class RemoteError extends AppError {
  RemoteError(super.message);
}
