import 'package:flutter/material.dart';
import 'package:tusindirme_sozlik_flutter/design/colors/colors.dart';
import 'package:tusindirme_sozlik_flutter/ui/presentation/settings/widgets/change_font_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: const Text("Sazlawlar",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20))
        ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChangeFontCard(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Túngi rejim",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                Icon(Icons.nights_stay, color: primaryColor)
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Baǵdarlama haqqinda",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                Icon(Icons.info, color: primaryColor)
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Úlestiriw",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                Icon(Icons.share, color: primaryColor)
              ],
            )
          ],
        ),
      ),
    );
  }
}
