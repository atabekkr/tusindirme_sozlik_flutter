import 'package:flutter/material.dart';
import 'package:tusindirme_sozlik_flutter/ui/presentation/home/widgets/daily_word_card.dart';
import 'package:tusindirme_sozlik_flutter/ui/presentation/home/widgets/popular_search_list.dart';

import '../../../design/colors/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: const Text('Túsindirme Sózlik',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20)),
      ),
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
