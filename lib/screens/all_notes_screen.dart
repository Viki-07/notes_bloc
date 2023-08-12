import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_bloc/cubit/note_cubits.dart';
import 'package:notes_bloc/cubit/note_states.dart';
import 'package:notes_bloc/screens/add_notes.dart';

class NoteGridScreen extends StatelessWidget {
  const NoteGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notecubit = context.read<NoteCubit>();
    notecubit.loadNotes();
    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      body: BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
          if (state is NoteLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NoteLoaded) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: state.notes.length,
                itemBuilder: (context, index) {
                  final note = state.notes[index];
                  return GestureDetector(
                   
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddEditNoteScreen(
                                note: note,
                              )));
                    },
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  note.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23,
                                  ),
                                ),
                                IconButton(onPressed: () =>
                        notecubit.deleteNote(state.notes[index].id), icon: const Icon(Icons.delete_outlined,size: 20,))
                              ],
                            ),
                            const Divider(),
                            const SizedBox(height: 10),
                            Text(
                              note.content,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is NoteError) {
            return Center(child: Text(state.message));
          }
          return Container(); // Placeholder or default view
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddEditNoteScreen()));
          // Navigate to the add/edit note screen
          // You can implement this part as needed
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
