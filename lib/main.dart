import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app_2/constants.dart';
import 'package:notes_app_2/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app_2/models/note_model.dart';
import 'package:notes_app_2/simple_bloc_observer.dart';
import 'package:notes_app_2/views/notes_view.dart';

void main() async {
  // awl haha ha3ml initialize l hive
  await Hive.initFlutter();

  // l data bttkhzn fe box
  // f ana 3yza aft7 l box da 34an astkhdm l data
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // awl haga mt7aga a7dd l theme bta3e
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
        home: const NotesView(),
      ),
    );
  }
}
