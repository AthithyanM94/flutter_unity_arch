class AppException implements Exception {
  final dynamic _message;
  final dynamic _prefix;

  AppException(this._message, this._prefix);

  @override
  String toString() {
    return "$_prefix | $_message";
  }
}

class GenericException extends AppException {
  GenericException([String? message]) : super(message, "Generic Error : ");
}
