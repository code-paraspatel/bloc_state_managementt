
import 'package:flutter/material.dart';

class SnackBarUtils {

  static showProgressBar(BuildContext context){
    showDialog(context: context, builder: (_) => const Center(child: CircularProgressIndicator(),),);
  }
 static myShowSnackBar (BuildContext context,String message){
   return ScaffoldMessenger.of(context)
        .showSnackBar(
        SnackBar(
            content: Text(message)));
  }
}