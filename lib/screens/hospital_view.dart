import 'package:flutter/material.dart';
import 'package:redlink/screens/donor_request_edit_view.dart';
import 'package:redlink/screens/donor_request_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:redlink/consts/firebase_doc_const.dart';

class HospitalView extends StatefulWidget {
  const HospitalView({super.key});

  @override
  State<HospitalView> createState() => _HospitalViewState();
}

class _HospitalViewState extends State<HospitalView> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection(RedlinkNames.firebaseRequests)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => DonorRequestView(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Create Donation Request',
        ),
      ),
      body: StreamBuilder(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 3,
                        right: 3,
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        leading: Text(
                          snapshot.data!.docChanges[index]
                              .doc[RedlinkNames.bloodType],
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        title: Text(
                          snapshot.data!.docChanges[index]
                              .doc[RedlinkNames.hospitalName],
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(
                          "${snapshot.data!.docChanges[index].doc[RedlinkNames.unitsRequired]} units of blood",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DonorRequestEditView(
                                    docid: snapshot.data!.docs[index]),
                              ),
                            );
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
