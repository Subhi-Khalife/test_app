import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/application/theme/theme_bloc.dart';
import 'package:test_app/injection.dart';
import 'package:test_app/presentation/screens/home/screen/home_screen.dart';

GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection().init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final Future future;
  @override
  void initState() {
    super.initState();
    future = Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()..add(InitApp()), lazy: false),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            title: '',
            home: FutureBuilder(
              future: future,
              builder: (context, state) {
                if (state.connectionState == ConnectionState.waiting) return Container();
                return const HomeScreen();
              },
            ),
          );
        },
      ),
    );
  }
}
