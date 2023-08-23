import 'package:database_bloc/bloc/note_bloc.dart';
import 'package:database_bloc/database/app_database.dart';
import 'package:database_bloc/screens/add_note_page.dart';
import 'package:database_bloc/screens/dashboard_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => NoteBloc(db: AppDataBase.db),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashBoardPage(),
    );
  }
}
