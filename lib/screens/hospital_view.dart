import 'package:flutter/material.dart';
import 'package:redlink/screens/donor_request_view.dart';

class HospitalView extends StatelessWidget {
  const HospitalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hospital View')),
      body: SafeArea(
        child: Expanded(
          child: Column(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DonorRequestView();
                        },
                      ),
                    );
                  },
                  child: const Text('Donor Request')),
            ],
          ),
        ),
      ),
    );
  }
}
