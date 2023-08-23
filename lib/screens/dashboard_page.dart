import 'package:database_bloc/bloc/note_bloc.dart';
import 'package:database_bloc/screens/add_note_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  void initState() {
    super.initState();
    context.read<NoteBloc>().add(fetchNoteEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Notes'),
      ),
      body: BlocBuilder<NoteBloc, NoteState>(
        builder: (_, stste) {
          if (stste is NoteLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (stste is NoteErrorState) {
            return Center(
              child: Text(stste.errorMsg),
            );
          } else if (stste is NoteLoadedState) {
            return stste.arrNotes.isNotEmpty
                ? ListView.builder(
                    itemCount: stste.arrNotes.length,
                    itemBuilder: (_, index) {
                      var thisNote = stste.arrNotes[index];
                      return ListTile(
                        title: Text(thisNote.title),
                        subtitle: Text(thisNote.desc),
                      );
                    })
                : Center(
                    child: Text('No Notes Yet\nAdd your first note today..'));
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNotePage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
