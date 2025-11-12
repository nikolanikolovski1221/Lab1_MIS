import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_details_screen.dart';


class ExamListScreen extends StatelessWidget {
  const ExamListScreen({super.key});


  @override
  Widget build(BuildContext context) {
    List<Exam> exams = [
      Exam(subject: 'Структурно програмирање', dateTime: DateTime(2025, 1, 15, 10, 0), rooms: ['101', '102']),
      Exam(subject: 'Веб програмирање', dateTime: DateTime(2025, 1, 18, 12, 0), rooms: ['201']),
      Exam(subject: 'Програмирање на видео игри', dateTime: DateTime(2025, 1, 20, 9, 0), rooms: ['Lab 1']),
      Exam(subject: 'ООП', dateTime: DateTime(2025, 1, 22, 11, 0), rooms: ['Lab 2']),
      Exam(subject: 'Алгоритми', dateTime: DateTime(2025, 11, 25, 8, 0), rooms: ['301']),
      Exam(subject: 'Бази на податоци', dateTime: DateTime(2025, 12, 27, 14, 0), rooms: ['302']),
      Exam(subject: 'Мрежи', dateTime: DateTime(2025, 12, 29, 10, 0), rooms: ['203']),
      Exam(subject: 'Оперативни системи', dateTime: DateTime(2025, 11, 14, 9, 0), rooms: ['204']),
      Exam(subject: 'Вештачка интелигенција', dateTime: DateTime(2025, 12, 4, 13, 0), rooms: ['Lab 3']),
      Exam(subject: 'Бизнис и менаџмент', dateTime: DateTime(2025, 12, 7, 10, 0), rooms: ['101']),
    ];


    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));


    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 223121'),
      ),


      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: exams.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ExamDetailsScreen(exam: exams[index]),
              ),
            ),
            child: ExamCard(exam: exams[index]),
          );
        },
      ),


      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.blue,
        child: Text(
          'Вкупно испити: ${exams.length}',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}