import 'package:flutter/material.dart';
import 'package:redlink/screens/donor_view.dart';
import 'package:redlink/screens/hospital_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const DonorView();
                          },
                        ),
                      );
                    },
                    child: const Text('Donor')),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const HospitalView();
                          },
                        ),
                      );
                    },
                    child: const Text('Hospital')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
