import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tusindirme_sozlik_flutter/design/colors/colors.dart';
import 'package:tusindirme_sozlik_flutter/home/presentation/home/home_screen.dart';
import 'package:tusindirme_sozlik_flutter/words_screen.dart';

import 'home/presentation/home/bloc/home_bloc.dart';
import 'home/presentation/home/repository/home_repository.dart';

void main() => runApp(const BottomNavigationBarExampleApp());

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider<HomeRepository>(
          create: (context) => HomeRepository(),
          child: BlocProvider(
            lazy: false,
            create: (BuildContext context) => HomeBloc(
                homeRepository: context.read<HomeRepository>()),
            child: const BottomNavigationBarExample(),
          )),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    WordsScreen(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    context.read<HomeBloc>().add(GetDailyWordEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: const Text('Túsindirme Sózlik',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20)),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Bas bet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Sózler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Sazlawlar',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
