part of common;

extension ErrorTypeShowError on ErrorType {
  String getMessage(BuildContext context) {
    switch (this) {
      case ErrorType.loginFailed:
        return E.seeAll;

      case ErrorType.loginSuccess:
        return E.seeAll;
      case ErrorType.loginInvalid:
        return E.seeAll;

      case ErrorType.loginCancelled:
        return E.seeAll;

      case ErrorType.updateFailed:
        return E.seeAll;

      case ErrorType.updateSuccess:
        return E.seeAll;

      case ErrorType.registerSuccess:
        return E.seeAll;

      case ErrorType.registerFailed:
        return E.seeAll;

      case ErrorType.missingLoginCredential:
        return E.seeAll;
    }
  }
}
