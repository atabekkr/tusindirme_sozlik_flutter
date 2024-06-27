import 'package:flutter/material.dart';
import 'package:tusindirme_sozlik_flutter/data/model/daily_word_model.dart';
import 'package:tusindirme_sozlik_flutter/design/colors/colors.dart';

import '../../../../api_provider/api.dart';

class AllWordsList extends StatefulWidget {
  const AllWordsList({super.key});

  @override
  _AllWordsListState createState() => _AllWordsListState();
}

class _AllWordsListState extends State<AllWordsList> {
  final ScrollController _scrollController = ScrollController();
  final ApiProvider _apiProvider = ApiProvider();
  final List<Word> _words = [];
  int _currentPage = 1;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchWords();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !_isLoading) {
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
    setState(() {
      _isLoading = true;
    });
    List<Word> newAlbums = await _apiProvider.fetchAlbums(_currentPage);
    setState(() {
      _isLoading = false;
      _words.addAll(newAlbums);
      _currentPage++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        controller: _scrollController,
        itemCount: _isLoading ? _words.length + 1 : _words.length,
        itemBuilder: (BuildContext context, int index) {
          if (index < _words.length) {
            Word word = _words[index];
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
        },
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            childAspectRatio: 4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 0),
      ),
    );
  }
}
