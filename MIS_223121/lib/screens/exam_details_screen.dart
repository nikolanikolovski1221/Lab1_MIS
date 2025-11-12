import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';


class ExamDetailsScreen extends StatelessWidget {
  final Exam exam;


  const ExamDetailsScreen({super.key, required this.exam});


  String timeLeft() {
    final now = DateTime.now();
    final diff = exam.dateTime.difference(now);


    final days = diff.inDays;
    final hours = diff.inHours % 24;


    return "$days дена, $hours часа";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subject),
      ),


      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exam.subject,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),


            Row(
              children: [
                const Icon(Icons.calendar_month, size: 28),
                const SizedBox(width: 10),
                Text(
                  DateFormat('dd.MM.yyyy HH:mm').format(exam.dateTime),
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),


            const SizedBox(height: 20),


            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.room, size: 28),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    exam.rooms.join(', '),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),


            const SizedBox(height: 30),


            const Text(
              'Преостанато време:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),


            Text(
              timeLeft(),
              style: const TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}