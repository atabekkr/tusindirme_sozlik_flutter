import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../design/colors/colors.dart';
import '../bloc/home_bloc.dart';

class DailyWordCard extends StatefulWidget {
  const DailyWordCard({Key? key}) : super(key: key);

  @override
  State<DailyWordCard> createState() => _DailyWordCardState();
}

class _DailyWordCardState extends State<DailyWordCard> {

  @override
  void initState() {
    HomeBloc bloc = context.read<HomeBloc>();
    bloc.add(GetDailyWordEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        // if (state is HomeLoadingState) {
        //   return const Center(
        //     child: CircularProgressIndicator(),
        //   );
        // }
        if (state is HomeLoadingFailedState) {
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
                  state.errorMessage,
                  style: const TextStyle(color: Colors.redAccent),
                ),
              ],
            ),
          );
        }
        if (state is DailyWordCardLoadedState) {
          return Center(
            child: Card(
              color: Colors.white,
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  debugPrint('Card tapped.');
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
                                      borderRadius: BorderRadius.circular(8.0),
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
                        Text("${state.data.title!.latin}",
                            style: const TextStyle(
                                color: primaryColor, fontSize: 22.0)),
                        const SizedBox(width: 14.0),
                        const Icon(Icons.volume_up_rounded, color: primaryColor)
                      ]),
                      const SizedBox(height: 6.0),
                      Text("${state.data.description!.latin}",
                          style:
                              const TextStyle(color: primaryColor, height: 1.2))
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
