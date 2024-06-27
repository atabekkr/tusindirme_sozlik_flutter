import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tusindirme_sozlik_flutter/home/presentation/home/bloc/home_bloc.dart';

import '../../../../design/colors/colors.dart';
import '../../word/word_screen.dart';

class PopularSearchList extends StatefulWidget {
  const PopularSearchList({super.key});

  @override
  State<PopularSearchList> createState() => _PopularSearchListState();
}

class _PopularSearchListState extends State<PopularSearchList> {
  final _bloc = HomeBloc();

  @override
  void initState() {
    _bloc.add(GetPopularWordsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _bloc,
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.status == EnumStatus.error) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.network_check_rounded,
                      color: Colors.blueAccent,
                      size: 40.0,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      state.message,
                      style: const TextStyle(color: Colors.redAccent),
                    ),
                  ],
                ),
              );
            }
            return Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                    childAspectRatio: 4,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 0),
                itemBuilder: (BuildContext context, int index) {
                  String? word = state.words[index].title?.latin;
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WordScreen(
                                      wordId: "${state.words[index].id}",
                                    )));
                      },
                      child: Text(
                        word?.toLowerCase() ?? "Undefined",
                        style: const TextStyle(
                            color: primaryColor, fontSize: 18.0),
                      ));
                },
                itemCount: state.words.length,
              ),
            );
          },
        ));
  }
}
