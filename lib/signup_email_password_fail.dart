class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = "An Unknown error occured."]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password ':
        return SignUpWithEmailAndPasswordFailure(
            'Please enter a stronger password.');
      case 'Invalid-email ':
        return SignUpWithEmailAndPasswordFailure(
            'Email is not vaid or badly formatted.');
      case 'email-already-in-use ':
        return SignUpWithEmailAndPasswordFailure(
            'An Account already for that email.');
      case 'operation-not-allowed ':
        return SignUpWithEmailAndPasswordFailure(
            'Operation is not allowed. Please contact support for help.');

      default:
        return SignUpWithEmailAndPasswordFailure();
    }
  }
}
