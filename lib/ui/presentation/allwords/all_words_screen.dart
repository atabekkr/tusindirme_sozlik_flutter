import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tusindirme_sozlik_flutter/design/colors/colors.dart';
import 'package:tusindirme_sozlik_flutter/ui/presentation/allwords/bloc/search_bloc.dart';
import 'package:tusindirme_sozlik_flutter/ui/presentation/allwords/widgets/all_words_list.dart';

class AllWordsScreen extends StatefulWidget {
  const AllWordsScreen({super.key});

  @override
  State<AllWordsScreen> createState() => _AllWordsScreenState();
}

class _AllWordsScreenState extends State<AllWordsScreen> {
  final _bloc = SearchBloc();

  final TextEditingController _searchController = TextEditingController();
  bool isSearchClicked = false;
  String searchText = '';

  void _onSearchChanged(String value) {
    setState(() {
      searchText = value;
      _bloc.add(GetSearchResultEvent(searchText: searchText));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            centerTitle: true,
            /* if the search button is clickable then show
         the container otherwise text "Search Bar"*/
            title: isSearchClicked
                ? Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: _onSearchChanged,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 12),
                          hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none,
                          hintText: 'Sózlerdi izlew..'),
                    ),
                  )
                : const Text('Sózler',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20)),
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isSearchClicked = !isSearchClicked;
                    if (!isSearchClicked) {
                      _searchController.clear();
                    }
                  });
                },
                icon: Icon(isSearchClicked ? Icons.close : Icons.search,
                    color: Colors.white),
              )
            ],
          ),
          body: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is SearchResultLoadedResult) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Text(state.words[index].title?.latin ?? "Not found");
                  },
                  itemCount: state.words.length
                );
              }
              return Container(
                  margin: const EdgeInsets.all(20),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text("Sózler dizimi", style: TextStyle(fontSize: 18.0)),
                      SizedBox(height: 20),
                      AllWordsList(),
                    ],
                  ));
            },
          )),
    );
  }
}
