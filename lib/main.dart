import 'package:appointment_app/core/helpers/shared_preferences_helper.dart';
import 'package:appointment_app/core/helpers/shared_preferences_keys.dart';
import 'package:appointment_app/doc_doc_app.dart';
import 'package:flutter/material.dart';

import 'core/di/dependancy_injection.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 await isCheckedLogged();
  setupGetIt();
  runApp(const DocDocApp());
}

Future<void> isCheckedLogged()async{
  String? token=await SharedPreferencesHelper.getSecuredString(SharedPreferencesKeys.userToke);
   if(token == null || token.isEmpty){
     isLogged= false;
   }
   else{
     isLogged=true;
   }
}