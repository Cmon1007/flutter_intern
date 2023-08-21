part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}
class SignInEvent extends AuthEvent{
  final String username;
  final String password;
  SignInEvent({
    required this.username,
    required this.password
});
}
class GetUserDetailsEvent extends AuthEvent{
  final String token;
  GetUserDetailsEvent(
  {
    required this.token,
}
      );
}
