part of common;

class ExceptionMS implements Exception {
  final dynamic message;

  ExceptionMS([this.message]);

  @override
  String toString() {
    Object? message = this.message;
    if (message == null) return "Exception".tr;
    return message.toString();
  }
}
