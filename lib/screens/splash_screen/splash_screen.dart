import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:inventi_coding_exam/screens/splash_screen/presentation/bloc/splash_screen_bloc.dart';
import 'package:inventi_coding_exam/utils/color/color_constants.dart';
import 'package:inventi_coding_exam/utils/route/route_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashScreenBloc splashScreenBloc;

  @override
  void initState() {
    splashScreenBloc = BlocProvider.of<SplashScreenBloc>(context);
    splashScreenBloc.add(ShowSplashScreenEvent());
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      body: BlocConsumer(
        bloc: splashScreenBloc,
        listener: (context, state) {
          if (state is SplashScreenLoadedState) {
            context.goNamed(routeLogin);
          }
        },
        builder: (context, state) {
          return Center(
              child: Image.asset('assets/images/img_inventi_logo.png'),
          );
        },
      ),
    );
  }
}
