import 'package:flutter/material.dart';

class DonorView extends StatelessWidget {
  const DonorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Donor View')),
      body: const SafeArea(
        child: Expanded(
          child: Text('Donor View'),
        ),
      ),
    );
  }
}
