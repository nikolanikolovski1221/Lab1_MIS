import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:intl/intl.dart';


class ExamCard extends StatelessWidget {
  final Exam exam;


  const ExamCard({super.key, required this.exam});


  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isPast = exam.dateTime.isBefore(now);


    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: isPast ? Colors.red.shade100 : Colors.green.shade100,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exam.subject,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),


            Row(
              children: [
                const Icon(Icons.calendar_month),
                const SizedBox(width: 6),
                Text(DateFormat('dd.MM.yyyy HH:mm').format(exam.dateTime)),
              ],
            ),


            const SizedBox(height: 6),


            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.room),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(exam.rooms.join(', ')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}