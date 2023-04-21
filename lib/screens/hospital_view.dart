import 'package:flutter/material.dart';

class HospitalView extends StatelessWidget {
  const HospitalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hospital View')),
      body: const SafeArea(
        child: Expanded(
          child: Text('Hospital View'),
        ),
      ),
    );
  }
}
