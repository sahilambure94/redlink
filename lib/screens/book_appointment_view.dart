import 'package:flutter/material.dart';

class BookAppointmentView extends StatelessWidget {
  const BookAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Booked'),
      ),
      body: const SafeArea(
        child: Text('Appointment Booked!'),
      ),
    );
  }
}
