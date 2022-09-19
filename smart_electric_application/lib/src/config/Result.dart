enum ResultStatus { success, error }

class Result<T, E> {
  final E? error;
  final T? value;
  final ResultStatus status;

  const Result.success(this.value)
      : status = ResultStatus.success,
        error = null;
  const Result.failure(this.error)
      : status = ResultStatus.error,
        value = null;

  Result._internal(this.status, this.error, this.value);
}