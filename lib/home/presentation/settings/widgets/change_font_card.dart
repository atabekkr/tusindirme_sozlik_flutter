import 'package:flutter/material.dart';

class ChangeFontCard extends StatefulWidget {
  const ChangeFontCard({super.key});

  @override
  State<ChangeFontCard> createState() => _ChangeFontCardState();
}

class _ChangeFontCardState extends State<ChangeFontCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: Card(
        color: Colors.white,
        clipBehavior: Clip.hardEdge,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text("Álipbeni ózgertiw",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              selectFont()
            ]
          )
        ),
      ),
    );
  }

  final List<bool> _isSelected = [false, true];

  Widget selectFont() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(30)),
        width: 185,
        height: 30,
        child: ToggleButtons(
            borderColor: Colors.transparent,
            selectedBorderColor: Colors.transparent,
            isSelected: _isSelected,
            fillColor: Colors.transparent,
            highlightColor: Colors.transparent,
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                      color: _isSelected[0] ? Colors.white : Colors.blue),
                  width: 90,
                  height: 30,
                  alignment: Alignment.center,
                  child: Text("Latin",
                      style: TextStyle(
                          color:
                              _isSelected[0] ? Colors.blue : Colors.white))),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      color: _isSelected[1] ? Colors.white : Colors.blue),
                  width: 90,
                  height: 30,
                  alignment: Alignment.center,
                  child: Text("Kiril",
                      style: TextStyle(
                          color:
                              _isSelected[1] ? Colors.blue : Colors.white)))
            ],
            onPressed: (index) {
              setState(() {
                if (index == 0) {
                  _isSelected[0] = true;
                  _isSelected[1] = false;
                } else {
                  _isSelected[1] = true;
                  _isSelected[0] = false;
                }
              });
            }),
      ),
    );
  }
}
