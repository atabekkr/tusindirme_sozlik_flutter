import 'package:flutter/material.dart';
import 'package:tusindirme_sozlik_flutter/home/presentation/home/widgets/daily_word_card.dart';
import 'package:tusindirme_sozlik_flutter/home/presentation/home/widgets/popular_search_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DailyWordCard(),
              SizedBox(height: 32.0),
              Text("Galabaliq izlewler", style: TextStyle(fontSize: 18.0)),
              Text("Qaraqalpaq tili sozligi",
                  style: TextStyle(color: Colors.black38)),
              SizedBox(height: 24.0),
              PopularSearchList()
            ]),
      ),
    );
  }
}
