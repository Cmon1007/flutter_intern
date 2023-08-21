part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitialState extends AuthState {}
class AuthLoadingState  extends AuthState{

}
class AuthSuccessState extends AuthState{
  final UserAuthModel userData;

  AuthSuccessState(
  {
    required this.userData,
}
      );
}
class AuthFailureState extends AuthState{
 final String errorMessage;
 AuthFailureState({
   required this.errorMessage
});
}
