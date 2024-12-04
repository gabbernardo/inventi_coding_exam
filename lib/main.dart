import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/presentation/bloc/homepage_bloc.dart';
import 'package:inventi_coding_exam/screens/splash_screen/presentation/bloc/splash_screen_bloc.dart';
import 'package:inventi_coding_exam/utils/color/color_constants.dart';
import 'package:inventi_coding_exam/utils/route/route_generator.dart';

import 'dependency_injection/dependency_injection.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashScreenBloc(),
        ),
        BlocProvider(
          create: (context) => di.serviceLocator<HomepageBloc>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Iventi Coding Exam',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: colorPrimary,
          ),
          useMaterial3: true,
        ),
        routerConfig: RouteGenerator.router,
      ),
    );
  }
}
