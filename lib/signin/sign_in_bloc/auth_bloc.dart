import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/signin/model/user_auth_model.dart';
import 'package:e_commerce/signin/repository/auth_repo.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<SignInEvent>(signInEvent);
    on<GetUserDetailsEvent>(getUserDetailsEvent);
  }
  FutureOr<void> signInEvent(SignInEvent event, Emitter<AuthState> emit) async{
    try{
      emit(AuthLoadingState());
      UserAuthModel loginData= await AuthenticationRepo.loginInfo(event.username, event.password);
      print(loginData);
      if(loginData!=null)
        {
          SharedPreferences _prefs= await SharedPreferences.getInstance();
          _prefs.setString('token', loginData.token);
          // _prefs.setString('userDetail', loginData.username);
          emit(AuthSuccessState(userData: loginData));
        }
      else{
        emit(AuthFailureState(errorMessage: "Invalid credentials"));
      }
    }
    catch(e)
    {
      emit(AuthFailureState(errorMessage: "Invalid Credentials"));
    }
  }

  FutureOr<void> getUserDetailsEvent(GetUserDetailsEvent event, Emitter<AuthState> emit) async{
    try
        {
        SharedPreferences _prefs= await SharedPreferences.getInstance();
        String ? token=_prefs.getString('token');
        // String ? username= _prefs.getString('userDetail');
        if (token != null && token.isNotEmpty) {
          UserAuthModel userDetails =
          await AuthenticationRepo.getUserDetails(token);
          emit(AuthSuccessState(userData: userDetails));
        } else {
          emit(AuthFailureState(errorMessage: "Token not found"));
        }
        }
        catch(e)
    {

    }
  }
}
