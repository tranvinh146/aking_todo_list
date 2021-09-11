import 'package:aking_to_do_list/ui/screens/add/add_check_list/add_check_list_screen.dart';
import 'package:aking_to_do_list/ui/screens/add/add_quick_note/add_quick_note_screen.dart';
import 'package:aking_to_do_list/ui/screens/add/add_task/add_task_screen.dart';
import 'package:aking_to_do_list/ui/screens/detail/project_detail/project_detail_screen.dart';
import 'package:aking_to_do_list/ui/screens/detail/task_detail/task_detail_screen.dart';
import 'package:aking_to_do_list/ui/screens/home/my_task/my_task_screen.dart';
import 'package:aking_to_do_list/ui/screens/login/forgot_password/forgot_password_screen.dart';
import 'package:aking_to_do_list/ui/screens/login/reset_password/reset_password_screen.dart';
import 'package:aking_to_do_list/ui/screens/login/sign_in/sign_in_screen.dart';
import 'package:aking_to_do_list/ui/screens/login/successfully_reset/successfully_reset_screen.dart';
import 'package:aking_to_do_list/ui/screens/home/menu/menu_screen.dart';
import 'package:aking_to_do_list/ui/screens/home/profile/profile_screen.dart';
import 'package:aking_to_do_list/ui/screens/home/quick/quick_screen.dart';
import 'package:aking_to_do_list/ui/screens/init/splash/splash_screen.dart';
import 'package:aking_to_do_list/ui/screens/init/onbroading/onbroading_screen.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

final Map<String, WidgetBuilder> routes = {
  //init screens
  SplashScreen.routeName: (context) => SplashScreen(),
  OnbroadingScreen.routeName: (context) => OnbroadingScreen(),

  //login screens
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  ResetPasswordScreen.routeName: (context) => ResetPasswordScreen(),
  SuccessfullyResetScreen.routeName: (context) => SuccessfullyResetScreen(),

  //home screens
  MyTaskScreen.routeName: (context) => MyTaskScreen(),
  MenuScreen.routeName: (context) => MenuScreen(),
  QuickScreen.routeName: (context) => QuickScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),

  //add screens
  AddTaskScreen.routeName: (context) => AddTaskScreen(),
  AddCheckListScreen.routeName: (context) => AddCheckListScreen(),
  AddQuickNoteScreen.routeName: (context) => AddQuickNoteScreen(),

  //detail screens
  TaskDetailScreen.routeName: (context) => TaskDetailScreen(),
  ProjectDetailScreen.routeName: (context) => ProjectDetailScreen(),
};
