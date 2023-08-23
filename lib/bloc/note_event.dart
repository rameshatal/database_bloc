part of 'note_bloc.dart';

@immutable
abstract class NoteEvent {}

class AddNoteEvent extends NoteEvent {
  NoteModel newNote;
  AddNoteEvent({required this.newNote});
}

class fetchNoteEvent extends NoteEvent {

}
