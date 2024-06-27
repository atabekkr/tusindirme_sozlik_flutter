import 'package:flutter/material.dart';
import 'package:tusindirme_sozlik_flutter/design/colors/colors.dart';
import 'package:tusindirme_sozlik_flutter/home/presentation/allwords/widgets/all_words_list.dart';

class AllWordsScreen extends StatefulWidget {
  const AllWordsScreen({super.key});

  @override
  State<AllWordsScreen> createState() => _AllWordsScreenState();
}

class _AllWordsScreenState extends State<AllWordsScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isSearchClicked = false;
  String searchText = '';
  List<String> items = [
    'Items 1',
    'Messi',
    'Ronaldo',
    'Virat Kohli',
    '2',
    'Rock',
    'Elon Musk',
  ];

  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = List.from(items);
  }

  void _onSearchChanged(String value) {
    setState(() {
      searchText = value;
      myFilterItems();
    });
  }

  void myFilterItems() {
    if (searchText.isEmpty) {
      filteredItems = List.from(items);
    } else {
      filteredItems = items
          .where(
              (item) => item.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    myFilterItems();
                  }
                });
              },
              icon: Icon(isSearchClicked ? Icons.close : Icons.search,
                  color: Colors.white),
            )
          ],
        ),
        body: Container(margin: const EdgeInsets.all(20), child:
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text("Sózler dizimi", style: TextStyle(fontSize: 18.0)),
            SizedBox(height: 20),
            AllWordsList(),
          ],
        )));
  }
}
