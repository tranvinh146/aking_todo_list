import 'package:aking_to_do_list/database/task_databse.dart';
import 'package:aking_to_do_list/logic/bloc/note_bloc.dart';
import 'package:aking_to_do_list/logic/bloc/task_bloc.dart';
import 'package:aking_to_do_list/others/routes.dart';
import 'package:aking_to_do_list/ui/screens/init/splash/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'others/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await TaskDatabase.instance.init();
  runApp(BlocProvider());
}

class BlocProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TaskBloc>(create:(_) => TaskBloc()),
        Provider<NoteBloc>(create:(_) => NoteBloc()),
      ],
      child: AkingToDoList(),
    );
  }
}

class AkingToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aking to do list',
      theme: themeData(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
