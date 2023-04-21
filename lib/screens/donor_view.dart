import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:redlink/consts/firebase_doc_const.dart';
import 'package:redlink/screens/book_appointment_view.dart';
import 'package:redlink/screens/donor_request_view.dart';

class DonorView extends StatefulWidget {
  const DonorView({super.key});

  @override
  State<DonorView> createState() => _DonorViewState();
}

class _DonorViewState extends State<DonorView> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection(RedlinkNames.firebaseRequests)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pushReplacement(
      //       context,
      //       MaterialPageRoute(
      //         builder: (_) => DonorRequestView(),
      //       ),
      //     );
      //   },
      //   child: const Icon(
      //     Icons.add,
      //   ),
      // ),
      appBar: AppBar(
        title: const Text(
          'Donate Them',
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
                                builder: (_) => const BookAppointmentView(),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.event_available,
                            color: Colors.black87,
                          ),
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
