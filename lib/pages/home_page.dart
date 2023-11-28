import 'package:ap_assignment/services/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //firestore
  final FirestoreService firestoreService = FirestoreService();

  //text controller
  final TextEditingController textController = TextEditingController();

  // open a dialog vox to add a note
  void openNoteBox({String? docID}) {
    //print("button pressed");
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        //text user input
        content: TextField(
          controller: textController,
        ),
        actions: [
          //button to save
          ElevatedButton(
            onPressed: () {
              //add a new note
              if (docID == null) {
                firestoreService.addNote(textController.text);
              }

              //update an existing note
              else {
                firestoreService.updateNote(docID, textController.text);
              }

              //clear the text controller
              textController.clear();

              //close the box
              Navigator.pop(context);
            },
            child: const Text("Add"),
          )
        ],
      ),
    );
  }

  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            // Add your logo image here
            Image.asset(
              'images/logo.png', // Replace with the path to your logo image
              width: 40, // Adjust the width as needed
              height: 40, // Adjust the height as needed
            ),
            const SizedBox(
                width: 8), // Add some spacing between the logo and title
            Expanded(
              child: Text(
                'Ngwe 8', // Title text
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,// Adjust the font size as needed
                  color: Color(0xFF006DB6),
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout, color: Colors.red,),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNotesStream(),
        builder: (context, snapshot) {
          // if we have data, get all the docs
          if (snapshot.hasData) {
            List<DocumentSnapshot> notesList = snapshot.data!.docs;

            //display as a list
            return ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                // get each individual doc
                DocumentSnapshot document = notesList[index];
                String docID = document.id;

                //get  note from each doc
                Map<String, dynamic>? data =
                    document.data() as Map<String, dynamic>?;
                String noteText = data?['note'] ?? '';

                //display as a list title
                return Container(
                  height: 50,

                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey.shade200,
                  ),
                  child: ListTile(
                    title: Text(noteText),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () => openNoteBox(docID: docID),
                          icon: const Icon(Icons.edit_note,color: Color(0xFF006DB6),),
                        ),

                        //delete button
                        IconButton(
                          onPressed: () => firestoreService.deleteNote(docID),
                          icon: const Icon(Icons.delete, color: Colors.red,),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          // if there is no data return nothing
          else {
            return const Text("No notes...");
          }
        },
      ),
    );
  }
}
