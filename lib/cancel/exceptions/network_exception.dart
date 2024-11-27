class NetworkException implements Exception {
  final String message;
  NetworkException([this.message = 'Network error occurred.']);

  @override
  String toString() => 'NetworkException: $message';
}