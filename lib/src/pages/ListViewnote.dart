
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'Addresss.dart';
import 'notescreen.dart';

import 'package:flutter/cupertino.dart';





class ListViewNote extends StatefulWidget {
  @override
  _ListViewNoteState createState() => new _ListViewNoteState();
}

final notesReference = FirebaseDatabase.instance.reference().child('notes');

class _ListViewNoteState extends State<ListViewNote> {
  List<Note> items;
  StreamSubscription<Event> _onNoteAddedSubscription;
  StreamSubscription<Event> _onNoteChangedSubscription;

  @override
  void initState() {
    super.initState();

    items = new List();

    _onNoteAddedSubscription = notesReference.onChildAdded.listen(_onNoteAdded);
    _onNoteChangedSubscription = notesReference.onChildChanged.listen(_onNoteUpdated);
  }

  @override
  void dispose() {
    _onNoteAddedSubscription.cancel();
    _onNoteChangedSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Address Field',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Address Field'),
          centerTitle: true,
          backgroundColor: Colors.blue,

          
        ),
        body: Center(
          child: ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.all(15.0),
              itemBuilder: (context, position) {
                return Column(
                  children: <Widget>[
               
                    Divider(height: 5.0),
                    ListTile(
                      title: Text(
                        '${items[position].title}',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                      subtitle: Text(
                        '${items[position].description}',
                        style: new TextStyle(
                          fontSize: 18.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      leading: Column(
                        children: <Widget>[
                        //  Padding(padding: EdgeInsets.all(5.0)),
                          CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            radius: 4.0,
                            child: Text(
                              '${position + 1}',
                              style: TextStyle(
                                fontSize: 3.0,
                                color: Colors.white,
                              ),
                            ),
                            
                          ),
                          IconButton(
                              icon: const Icon(Icons.remove_circle_outline,size: 20,),
                              onPressed: () => _deleteNote(context, items[position], position)),
        

          

                        ],
                      ),
                      onTap: () => _navigateToNote(context, items[position]),
                    ),
                  ],
                );



              }),


              
        ),


    
    
     
      


    


        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _createNewNote(context),
        ),











        
      ),
    );
  }

  void _onNoteAdded(Event event) {
    setState(() {
      items.add(new Note.fromSnapshot(event.snapshot));
    });
  }

  void _onNoteUpdated(Event event) {
    var oldNoteValue = items.singleWhere((note) => note.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldNoteValue)] = new Note.fromSnapshot(event.snapshot);
    });
  }

  void _deleteNote(BuildContext context, Note note, int position) async {
    await notesReference.child(note.id).remove().then((_) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _navigateToNote(BuildContext context, Note note) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteScreen(note)),
    );
  }

  void _createNewNote(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteScreen(Note(null, '', ''))),
    );
  }
}
