import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_bloc/cubit/note_cubits.dart';
import 'package:notes_bloc/models/note_model.dart';

class AddEditNoteScreen extends StatefulWidget {
  final Note? note;

  const AddEditNoteScreen({super.key, this.note});

  @override
  _AddEditNoteScreenState createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note?.title ?? '');
    _contentController =
        TextEditingController(text: widget.note?.content ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(widget.note == null ? 'Add Note' : 'Edit Note')),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: const TextStyle(fontSize: 20),
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 300,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _contentController,
                    decoration: const InputDecoration(
                        labelText: 'Content', border: InputBorder.none),
                    maxLines: null,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 50,
                  width: 130,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_titleController.text.isEmpty) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please add a Title for note.')));
                        return;
                      }
                      if (_contentController.text.isEmpty) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Please add a Descriptio for note.')));
                        return;
                      }
                      final noteCubit = context.read<NoteCubit>();
                      if (widget.note == null) {
                        noteCubit.addNote(
                          Note(
                            id: DateTime.now().toString(),
                            title: _titleController.text,
                            content: _contentController.text,
                          ),
                        );
                      } else {
                        noteCubit.updateNote(
                          Note(
                            id: widget.note!.id,
                            title: _titleController.text,
                            content: _contentController.text,
                          ),
                        );
                      }
                      Navigator.pop(context);
                    },
                    child:
                        Text(widget.note == null ? 'Add Note' : 'Save Changes'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
