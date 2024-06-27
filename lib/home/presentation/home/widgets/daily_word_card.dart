import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tusindirme_sozlik_flutter/home/presentation/word/word_screen.dart';

import '../../../../design/colors/colors.dart';
import '../bloc/home_bloc.dart';

class DailyWordCard extends StatefulWidget {
  const DailyWordCard({Key? key}) : super(key: key);

  @override
  State<DailyWordCard> createState() => _DailyWordCardState();
}

class _DailyWordCardState extends State<DailyWordCard> {
  final _bloc = HomeBloc();

  @override
  void initState() {
    _bloc.add(GetDailyWordEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _bloc,
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.status == EnumStatus.loading && state.dailyWord == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
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
            return Center(
              child: Card(
                color: Colors.white,
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    debugPrint('Card tapped.');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                WordScreen(wordId: "${state.dailyWord?.id}")));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 16.0),
                                decoration: BoxDecoration(
                                    color: dailyWordsColor,
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: const Text(
                                  "Kún sózi",
                                  style: TextStyle(color: primaryColor),
                                )),
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        side: const BorderSide(
                                            color: primaryColor))),
                              ),
                              child: const Row(children: [
                                Icon(Icons.share_outlined, color: primaryColor),
                                SizedBox(width: 8),
                                Text("Úlestiriw",
                                    style: TextStyle(
                                        color: primaryColor, fontSize: 18.0))
                              ]),
                            )
                          ],
                        ),
                        const SizedBox(height: 6.0),
                        Row(children: [
                          Text(
                              state.dailyWord?.title?.latin?.toLowerCase() ??
                                  "Undefined",
                              style: const TextStyle(
                                  color: primaryColor, fontSize: 22.0)),
                          const SizedBox(width: 14.0),
                          const Icon(Icons.volume_up_rounded,
                              color: primaryColor)
                        ]),
                        const SizedBox(height: 6.0),
                        Text("${state.dailyWord?.description?.latin}",
                            maxLines: 6,
                            style: const TextStyle(
                                color: primaryColor, height: 1.2))
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
