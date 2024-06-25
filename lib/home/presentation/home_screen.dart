import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tusindirme_sozlik_flutter/design/colors/colors.dart';
import 'package:tusindirme_sozlik_flutter/home/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CardExample(),
          const SizedBox(height: 32.0),
          const Text("Galabaliq izlewler", style: TextStyle(fontSize: 18.0)),
          const Text("Qaraqalpaq tili sozligi",
              style: TextStyle(color: Colors.black38)),
          const SizedBox(height: 24.0),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  childAspectRatio: 4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 0),
              itemBuilder: (BuildContext context, int index) {
                return Text(
                  "Item $index",
                  style: const TextStyle(color: primaryColor, fontSize: 18.0),
                );
              },
              itemCount: 10,
            ),
          )
        ]),
      ),
    );
  }
}

class CardExample extends StatefulWidget {
  const CardExample({Key? key}) : super(key: key);

  @override
  State<CardExample> createState() => _CardExampleState();
}

class _CardExampleState extends State<CardExample> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductLoadingFailedState) {
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
        if (state is ProductLoadedState) {
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
                              child: Text(
                                state.data.title!.latin!,
                                style: const TextStyle(color: primaryColor),
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
                      const Row(children: [
                        Text("Salamatliq",
                            style:
                                TextStyle(color: primaryColor, fontSize: 22.0)),
                        SizedBox(width: 14.0),
                        Icon(Icons.volume_up_rounded, color: primaryColor)
                      ]),
                      const SizedBox(height: 6.0),
                      const Text(
                          "Erat tincidunt venenatis aliquet nulla. Vitae curabitur nunc risus egestas sed egestas eget egestas. Etiam faucibus elementum eu suspendisse. Convallis vel purus viverra turpis massa quis pretium est.",
                          style: TextStyle(color: primaryColor, height: 1.2))
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
