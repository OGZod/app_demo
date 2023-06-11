abstract class SignUpEvents{
  const SignUpEvents();
}
class UserNameEvent extends SignUpEvents{
  final String userName;
  const UserNameEvent(this.userName);
}
class EmailEvent extends SignUpEvents{
  final String email;
  const EmailEvent(this.email);
}
class PasswordEvent extends SignUpEvents{
  final String password;
  const PasswordEvent(this.password);
}
class ConfirmPasswordEvent extends SignUpEvents{
  final String confirmPassword;
  const ConfirmPasswordEvent(this.confirmPassword);
}