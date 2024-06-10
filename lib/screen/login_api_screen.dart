
import 'package:bloc_state_manegment/bloc/login_bloc/login_bloc.dart';
import 'package:bloc_state_manegment/bloc/login_bloc/login_event.dart';
import 'package:bloc_state_manegment/bloc/login_bloc/login_state.dart';
import 'package:bloc_state_manegment/screen/counter_screen.dart';
import 'package:bloc_state_manegment/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginApiScreen extends StatefulWidget {
  const LoginApiScreen({super.key});

  @override
  State<LoginApiScreen> createState() => _LoginApiScreenState();
}

class _LoginApiScreenState extends State<LoginApiScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    emailFocus.dispose();
    passwordController.dispose();
    passwordFocus.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body:SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Login Page',style: TextStyle(fontSize: 30,color: Colors.green),),
                  const SizedBox(height: 30,),
                  TextField(
                    controller: emailController,
                    focusNode: emailFocus,
                    decoration: InputDecoration(
                      hintText: 'Enter Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),),
                    onSubmitted: (value) {
                      FocusScope.of(context).requestFocus(passwordFocus);
                    },
                  ),
                  const SizedBox(height: 10,),
                  TextField(
                    controller: passwordController,
                    focusNode: passwordFocus,
                    decoration: InputDecoration(
                      hintText: 'Enter your passWord',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),),
                    onSubmitted: (value) {
                      //FocusScope.of(context).requestFocus(passwordFocus);
                    },
                  ),
                  const SizedBox(height: 50,),
                  BlocListener<LoginBloc,LoginState>(
                      listener:(context, state) async {
                        if(state.loginStatus == LoginStatus.loading){
                         SnackBarUtils.showProgressBar(context);
                         const CircularProgressIndicator();
                        }else if (state.loginStatus == LoginStatus.error){
                          Navigator.pop(context);
                          SnackBarUtils.myShowSnackBar(context, state.message.toString());
                        }else if(state.loginStatus == LoginStatus.success){
                          Navigator.pop(context);
                           SnackBarUtils.myShowSnackBar(context, state.message.toString());
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const CounterScreen(),));
                        }
                      },
                    child: BlocBuilder<LoginBloc,LoginState>(
                      builder: (context, state) {
                        return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                minimumSize: const Size(double.infinity, 60)
                            ),
                            onPressed: () {
                            //  FocusScope.of(context).dispose();
                              if(emailController.text.isEmpty || emailController.text == ''){
                                SnackBarUtils.myShowSnackBar(context, 'Enter Your Email');
                              }else if(passwordController.text.isEmpty || emailController.text == ""){
                                SnackBarUtils.myShowSnackBar(context, 'Enter Your PassWord');
                              }else{
                                context.read<LoginBloc>().add(UserLogin(
                                    email: emailController.text.toString(),
                                    passWord: passwordController.text.toString()));
                              }

                            }, child: const Text('Login',style: TextStyle(fontSize: 25,color: Colors.white),));
                      },),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
