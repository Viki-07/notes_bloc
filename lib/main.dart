import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_bloc/cubit/note_cubits.dart';
import 'package:notes_bloc/screens/all_notes_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
  providers: [
    BlocProvider<NoteCubit>(
      create: (BuildContext context) => NoteCubit(),
    ),
  ],
  child: MaterialApp(
    theme: ThemeData(
      useMaterial3: true
    ),
    home: const NoteGridScreen()),
);
  }
}
