import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoom_clone/resources/firesoresavemeeting.dart';

class previousmeeting extends StatelessWidget {
  const previousmeeting({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirestoreMethodes().meethistory,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return const Center(child: CircularProgressIndicator());
          final List<DocumentSnapshot> docu = snapshot.data!.docs;

          debugPrint(docu.length.toString());
          return ListView.builder(
              itemCount: docu.length,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 8,
                      shadowColor: const Color.fromARGB(255, 67, 67, 67),
                      child: ListTile(
                          title: Text(
                              'Room Name${(snapshot.data! as dynamic).docs[index].data()['meetingname']}'),
                          subtitle: Text(
                            'Joined on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index].data()['time'].toDate())}',
                          )),
                    ),
                  ));
        });
  }
}
