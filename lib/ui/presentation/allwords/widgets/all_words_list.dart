import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tusindirme_sozlik_flutter/data/model/daily_word_model.dart';
import 'package:tusindirme_sozlik_flutter/design/colors/colors.dart';
import 'package:tusindirme_sozlik_flutter/ui/presentation/allwords/bloc/all_words_bloc.dart';

import '../../word/word_screen.dart';

class AllWordsList extends StatefulWidget {
  const AllWordsList({super.key});

  @override
  _AllWordsListState createState() => _AllWordsListState();
}

class _AllWordsListState extends State<AllWordsList> {
  final _bloc = AllWordsBloc();
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _fetchWords();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchWords();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _fetchWords() async {
    _bloc.add(GetNewWordsEvent(pageIndex: _currentPage));
    _currentPage++;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocBuilder<AllWordsBloc, AllWordsState>(
        builder: (context, state) {
          return Expanded(
            child: GridView.builder(
              controller: _scrollController,
              itemCount: state.words.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WordScreen(
                                    wordId: "${state.words[index].id}",
                                  )));
                    },
                    child: getWords(state, index));
              },
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  childAspectRatio: 4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 0),
            ),
          );
        },
      ),
    );
  }

  Widget getWords(AllWordsState state, int index) {
    print("index = $index \nlength = ${state.words.length}");
    if (index < state.words.length) {
      Word word = state.words[index];
      return Row(
        children: [
          const Icon(Icons.circle, color: primaryColor, size: 14),
          const SizedBox(width: 8),
          Expanded(child: Text(word.title?.latin ?? "Not found")),
        ],
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
