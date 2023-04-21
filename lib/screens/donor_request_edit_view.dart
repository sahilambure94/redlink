
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:redlink/consts/firebase_doc_const.dart';
import 'package:redlink/screens/donor_view.dart';

class DonorRequestEditView extends StatefulWidget {
  DocumentSnapshot docid;
  DonorRequestEditView({
    super.key,
    required this.docid,
  });

  @override
  State<DonorRequestEditView> createState() => _DonorRequestEditViewState();
}

class _DonorRequestEditViewState extends State<DonorRequestEditView> {
  TextEditingController hospitalName = TextEditingController();
  TextEditingController bloodType = TextEditingController();
  TextEditingController unitsRequired = TextEditingController();

  @override
  void initState() {
    hospitalName = TextEditingController(
      text: widget.docid.get(RedlinkNames.hospitalName),
    );
    bloodType = TextEditingController(
      text: widget.docid.get(RedlinkNames.bloodType),
    );
    unitsRequired = TextEditingController(
      text: widget.docid.get(RedlinkNames.unitsRequired),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              widget.docid.reference.update({
                RedlinkNames.hospitalName: hospitalName.text,
                RedlinkNames.bloodType: bloodType.text,
                RedlinkNames.unitsRequired: unitsRequired.text,
              }).whenComplete(() {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const DonorView()));
              });
            },
            child: Text("save"),
          ),
          MaterialButton(
            onPressed: () {
              widget.docid.reference.delete().whenComplete(() {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const DonorView()));
              });
            },
            child: Text("delete"),
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
