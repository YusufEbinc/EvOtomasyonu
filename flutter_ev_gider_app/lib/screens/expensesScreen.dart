import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ev_gider_app/CustomWidgets/customFabButton.dart';

import 'package:flutter_ev_gider_app/constants/const.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;
CollectionReference _expenses =
    FirebaseFirestore.instance.collection('Harcamalar');

// ignore: must_be_immutable
class ExpensesPage extends StatefulWidget {
  ExpensesPage({Key? key}) : super(key: key);

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  TextEditingController urunAdi = TextEditingController();
  TextEditingController fiyat = TextEditingController();
  TextEditingController tarih = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("This is my message."),
      actions: [
        TextField(controller: urunAdi),
        TextField(
          keyboardType: TextInputType.number,
          controller: fiyat,
        ),
        TextField(
          keyboardType: TextInputType.datetime,
          controller: tarih,
        ),
        ElevatedButton(onPressed: ekle, child: Text('ekle')),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Harcamalar'),
        elevation: 0,
        backgroundColor: CAppBar,
      ),
      body: StreamBuilder(
        stream: _expenses.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return ListTile(
                title: Text(data['name']),
                subtitle: Text(data['fiyat'].toString()),
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: CustomFabButton(press: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      }),
    );
  }

  Future<void> ekle() async {
    try {
      await _firestore
          .collection('Harcamalar')
          .doc(urunAdi.text)
          .set({'fiyat': fiyat.text, 'name': 'tayyip', 'tarih': tarih.text});
    } on FirebaseAuthException catch (e) {
      print("veri ekeleme sırasında hata oluştu hata:$e");
    }
  }
}
