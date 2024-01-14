import 'package:flutter/material.dart';

class Doctor {
  final String name;
  final String specialization;

  Doctor(
    this.name,
    this.specialization,
  );
}

List<Doctor> doctors = [
  Doctor("Dr. John Doe", "Cardiologist"),
  Doctor("Dr. Jane Smith", "Pediatrician"),
];

class DoctorListPage extends StatelessWidget {
  const DoctorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Dokter'),
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return ListTile(
            title: Text(doctor.name),
            subtitle: Text(doctor.specialization),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/chat-room');
              },
              child: Text('Chat'),
            ),
          );
        },
      ),
    );
  }
}
