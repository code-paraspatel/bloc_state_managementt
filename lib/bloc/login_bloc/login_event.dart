import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object?> get props =>[];
}

class UserLogin extends LoginEvent {
  final String email;
  final String passWord;

  UserLogin({required this.email,required this.passWord});

  @override
  List<Object?> get props =>[email,passWord];
}