import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // REQUIRED: Import for DefaultFirebaseOptions
import 'add_note.dart';
import 'login.dart';
import 'notes_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // CORRECTED: Added options for Firebase initialization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Secure Notes',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
      routes: {
        // Assuming NotesList class will be used in notes_list.dart
        '/notes': (context) => const NotesList(),
        '/add-note': (context) => const AddNote(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}