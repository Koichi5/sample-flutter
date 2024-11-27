class FetchCancelledException implements Exception {
  final String message;
  FetchCancelledException([this.message = 'Fetching was canceled.']);

  @override
  String toString() => 'FetchCancelledException: $message';
}
