import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_bloc/models/note_model.dart';

class NoteRepository {
  final CollectionReference _noteCollection =
      FirebaseFirestore.instance.collection('notes');

  Future<List<Note>> getNotes() async {
    final snapshot =
        await _noteCollection.orderBy('id', descending: true).get();
    return snapshot.docs.map((doc) {
      return Note(
        id: doc.id,
        title: doc['title'],
        content: doc['content'],
      );
    }).toList();
  }

  Future<void> addNote(Note note) async {
    await _noteCollection.add({
      'id': note.id,
      'title': note.title,
      'content': note.content,
    });
  }

  Future<void> updateNote(Note note) async {
    await _noteCollection.doc(note.id).update({
      'title': note.title,
      'content': note.content,
    });
  }

  Future<void> deleteNote(String noteId) async {
    await _noteCollection.doc(noteId).delete();
  }
}
