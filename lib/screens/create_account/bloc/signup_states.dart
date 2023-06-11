class SignUpStates{

  final String userName;
  final String email;
  final String password;
  final String confirmPassword;

  const SignUpStates({
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.userName = ''
  });

  SignUpStates copyWith({
    String? userName,
    String? email,
    String? password,
    String? confirmPassword,
}){
    return SignUpStates(
        email: email??this.email,
        password: password??this.password,
        confirmPassword: confirmPassword??this.confirmPassword,
        userName: userName??this.userName
    );
  }
}
