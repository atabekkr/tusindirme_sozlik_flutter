import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tusindirme_sozlik_flutter/design/colors/colors.dart';
import 'package:tusindirme_sozlik_flutter/home/presentation/word/bloc/word_bloc.dart';

class WordScreen extends StatefulWidget {
  const WordScreen({super.key});

  @override
  State<WordScreen> createState() => _WordScreenState();
}

class _WordScreenState extends State<WordScreen> {
  final _bloc = WordBloc();

  @override
  void initState() {
    _bloc.add(GetWordEvent(wordId: "1"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: primaryColor,
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text("Túsindirmesi",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20))),
        body: BlocBuilder<WordBloc, WordState>(
          builder: (context, state) {
            if (state is WordLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is WordLoadedState) {
              return Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      width: 150,
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: const BorderSide(color: primaryColor))),
                        ),
                        child: const Row(children: [
                          Icon(Icons.share_outlined, color: primaryColor),
                          SizedBox(width: 8),
                          Text("Úlestiriw",
                              style: TextStyle(
                                  color: primaryColor, fontSize: 18.0))
                        ]),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Text(state.word.title?.latin ?? "Not found",
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold))),
                      const SizedBox(width: 20),
                      const Icon(Icons.volume_up_rounded,
                          color: primaryColor, size: 30)
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 1),
                          borderRadius: BorderRadius.circular(4)),
                      margin: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                      child: Text(state.word.category?.latin ?? "Not found",
                          style: const TextStyle(color: primaryColor)),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: const Align(
                          alignment: Alignment.topLeft,
                          child: Text("TÚSINDIRMESI"))),
                  Container(
                      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            state.word.description?.latin ??
                                "Definition not found",
                            style: const TextStyle(color: primaryColor),
                          )))
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
