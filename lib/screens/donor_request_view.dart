import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:redlink/consts/firebase_doc_const.dart';
import 'package:redlink/screens/donor_view.dart';

class DonorRequestView extends StatelessWidget {
  TextEditingController hospitalName = TextEditingController();
  TextEditingController bloodType = TextEditingController();
  TextEditingController unitsRequired = TextEditingController();

  CollectionReference ref =
      FirebaseFirestore.instance.collection(RedlinkNames.firebaseRequests);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              ref.add({
                RedlinkNames.hospitalName: hospitalName.text,
                RedlinkNames.bloodType: bloodType.text,
                RedlinkNames.unitsRequired: unitsRequired.text,
              }).whenComplete(() {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const DonorView()));
              });
            },
            child: Text(
              "save",
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: hospitalName,
                decoration: InputDecoration(
                  hintText: 'Hospital Name',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: bloodType,
                  expands: true,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Required Blood Type',
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: unitsRequired,
                  expands: true,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Quantity in Units',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
