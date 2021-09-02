class FundaResponse<T> {
  final T? success;
  final String? error;

  FundaResponse.success(this.success, {this.error});
  FundaResponse.error(this.error, {this.success});

  bool isSuccess() => success != null;
}
