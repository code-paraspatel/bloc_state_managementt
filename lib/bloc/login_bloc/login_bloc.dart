


import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_state_manegment/bloc/login_bloc/login_event.dart';
import 'package:bloc_state_manegment/bloc/login_bloc/login_state.dart';
import 'package:http/http.dart' as http;
class LoginBloc extends Bloc<LoginEvent,LoginState>{

  LoginBloc():super(const LoginState()){
    on<UserLogin>(_userLogin);
  }

  _userLogin(UserLogin even , Emitter<LoginState> emit) async {
    Map data ={
      "email":even.email,
      "password" : even.passWord
    };
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    try{
      final response = await http.post(
          Uri.parse('https://reqres.in/api/login'),
        body: data
      );
      final data1 = jsonDecode(response.body);
      if(response.statusCode == 200){
        emit(state.copyWith(
          loginStatus: LoginStatus.success,
          message: 'Login SuccessFully'
        ));
        print(data1);
      }else{
        emit(state.copyWith(loginStatus: LoginStatus.error,message: data1['error']));
      }
    }catch(e){
      emit(state.copyWith(
        loginStatus: LoginStatus.error,
        message: e.toString(),
      ));
    }
  }

}