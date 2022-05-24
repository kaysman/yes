import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:yes_demo/helpers/colors.dart';
import 'package:yes_demo/notification/notification_service.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class FirebaseLearn extends StatefulWidget {
  const FirebaseLearn({Key? key}) : super(key: key);

  @override
  State<FirebaseLearn> createState() => _FirebaseLearnState();
}

class _FirebaseLearnState extends State<FirebaseLearn> {
  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    NotificationService().getTokenSaveToDb('dani');
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController ratingController = TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    CollectionReference moviesRef = db.collection('movies');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Map<String, dynamic> data = {
            'name': nameController.text,
            'year': yearController.text,
            'rating': ratingController.text,
          };

          await NotificationService().sendNotification(data);
           FirebaseMessaging.onMessage.listen((event) {
           NotificationService().showNotification(1, event.notification?.title ?? '',
                event.notification?.body ?? '', 3);
          });
         
          // await moviesRef.doc(nameController.text).set(codingData);
          // nameController.text = '';
          // yearController.text = '';
          // ratingController.text = '';
        },
      ),
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: moviesRef.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Here is somthing went wrong try again!'),
                    );
                  } else {
                    if (snapshot.hasData) {
                      List<DocumentSnapshot> listOfData =
                          snapshot.data?.docs ?? [];
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: ListView.builder(
                          itemCount: snapshot.data?.docs.length ?? 0,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Text(listOfData[index]['name']),
                                subtitle: Text('${listOfData[index]['year']}'),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: primaryColor,
                                      ),
                                      onPressed: () async {
                                        await listOfData[index]
                                            .reference
                                            .delete();
                                      },
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        Map<String, dynamic> newData = {
                                          'name': nameController.text,
                                          'year': yearController.text,
                                          'rating': ratingController.text,
                                        };
                                        if (nameController.text.isNotEmpty ||
                                            yearController.text.isNotEmpty ||
                                            ratingController.text.isNotEmpty) {
                                          await listOfData[index]
                                              .reference
                                              .update(newData);
                                        }
                                      },
                                      icon: Icon(Icons.update),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Center(
                        child: SpinKitCircle(
                          color: primaryColor,
                        ),
                      );
                    }
                  }
                }),
            Form(
                child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: 'name'),
                ),
                TextFormField(
                  controller: yearController,
                  decoration: InputDecoration(hintText: 'year'),
                ),
                TextFormField(
                  controller: ratingController,
                  decoration: InputDecoration(hintText: 'rating'),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
