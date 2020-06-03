import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:turkish/turkish.dart';

class CustomCard extends StatelessWidget {
  final QuerySnapshot snapshot;
  final int index;

  const CustomCard({Key key, this.snapshot, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('tr_TR', null);

    var snapshotData = snapshot.documents[index].data;
    var docId = snapshot.documents[index].documentID;
    var timeToDate = new DateTime.fromMicrosecondsSinceEpoch(
        snapshotData['timestamp'].seconds * 1000000);
    var dateFormatted =
        new DateFormat('EEEE, d MMM y', 'tr_TR').format(timeToDate);

    return Column(
      children: <Widget>[
        Container(
          child: Card(
            elevation: 9.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(snapshotData['title']),
                  subtitle: Text(snapshotData['description']),
                  leading: CircleAvatar(
                    radius: 34.0,
                    child: Text(turkish
                        .toUpperCase(snapshotData['name'].toString()[0])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(" By: ${snapshotData["name"]} "),
                      Text(dateFormatted),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        FontAwesomeIcons.edit,
                        size: 15.0,
                      ),
                      onPressed: () async {
                        TextEditingController nameInputController =
                            new TextEditingController(
                                text: snapshotData['name']);
                        TextEditingController titleInputController =
                            new TextEditingController(
                                text: snapshotData['title']);
                        TextEditingController descriptionInputController =
                            new TextEditingController(
                                text: snapshotData['description']);

                        await showDialog(
                          context: context,
                          child: AlertDialog(
                            contentPadding: EdgeInsets.all(10),
                            content: Column(
                              children: <Widget>[
                                Text('Please fill out the form to up'),
                                Expanded(
                                  child: TextField(
                                    autofocus: true,
                                    autocorrect: true,
                                    decoration: InputDecoration(
                                        labelText: 'Your Name*'),
                                    controller: nameInputController,
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                    autofocus: true,
                                    autocorrect: true,
                                    decoration:
                                        InputDecoration(labelText: 'Title*'),
                                    controller: titleInputController,
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                    autofocus: true,
                                    autocorrect: true,
                                    decoration: InputDecoration(
                                        labelText: 'Description*'),
                                    controller: descriptionInputController,
                                  ),
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  nameInputController.clear();
                                  titleInputController.clear();
                                  descriptionInputController.clear();

                                  Navigator.pop(context);
                                },
                                child: Text('Cancel'),
                              ),
                              FlatButton(
                                onPressed: () {
                                  if (nameInputController.text.isNotEmpty &&
                                      titleInputController.text.isNotEmpty &&
                                      descriptionInputController
                                          .text.isNotEmpty) {
                                    Firestore.instance
                                        .collection('board')
                                        .document(docId)
                                        .updateData({
                                      "name": nameInputController.text,
                                      "title": titleInputController.text,
                                      "description":
                                          descriptionInputController.text,
                                      "timestamp": new DateTime.now()
                                    }).then((response) {
                                      Navigator.pop(context);
                                      nameInputController.clear();
                                      titleInputController.clear();
                                      descriptionInputController.clear();
                                    }).catchError((error) => print(error));
                                  }
                                },
                                child: Text('Update'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 19.0,
                    ),
                    IconButton(
                      icon: Icon(
                        FontAwesomeIcons.trashAlt,
                        size: 15.0,
                      ),
                      onPressed: () async {
                        var collectionRef =
                            Firestore.instance.collection('board');
                        await collectionRef.document(docId).delete();
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
