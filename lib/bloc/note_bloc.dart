import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../database/app_database.dart';
import '../models/note_model.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  AppDataBase db;
  NoteBloc({required this.db}) : super(NoteInitialState()) {
    ///(to add new note) event handling
    on<AddNoteEvent>((event, emit) async {
      emit(NoteLoadingState());
      bool check = await db.addNote(event.newNote);
      if (check) {
        var mArrNote = await db.fetchAllNotes();
        emit(NoteLoadedState(arrNotes: mArrNote));
      } else {
        emit(NoteErrorState(errorMsg: "Note not Added!!"));
      }
    });

    ///(get all notes) event handling
    on<fetchNoteEvent>((NoteEvent, myEmit) async {
      myEmit(NoteLoadingState());
      var mArrNotes = await db.fetchAllNotes();
      myEmit(NoteLoadedState(arrNotes: mArrNotes));
    });
  }
}
