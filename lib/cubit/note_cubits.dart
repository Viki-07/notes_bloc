import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_bloc/cubit/note_states.dart';
import 'package:notes_bloc/models/note_model.dart';
import 'package:notes_bloc/repository/note_repo.dart';

class NoteCubit extends Cubit<NoteState> {
  final NoteRepository _noteRepository = NoteRepository();

  NoteCubit() : super(NoteInitial());

  // Load notes from the repository
  Future<void> loadNotes() async {
    emit(NoteLoading());
    try {
      final notes = await _noteRepository.getNotes();
      emit(NoteLoaded(notes));
    } catch (e) {
      emit(const NoteError('Failed to load notes'));
    }
  }

  // Add a new note
  Future<void> addNote(Note note) async {
    try {
      await _noteRepository.addNote(note);
      loadNotes();
    } catch (e) {
      emit(const NoteError('Failed to add note'));
    }
  }

  // Update an existing note
  Future<void> updateNote(Note note) async {
    try {
      await _noteRepository.updateNote(note);
      loadNotes();
    } catch (e) {
      emit(const NoteError('Failed to update note'));
    }
  }

  // Delete a note
  Future<void> deleteNote(String noteId) async {
    try {
      await _noteRepository.deleteNote(noteId);
      loadNotes();
    } catch (e) {
      emit(const NoteError('Failed to delete note'));
    }
  }
}
