import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/presentation/bloc/homepage_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inventi_coding_exam/utils/color/color_constants.dart';
import 'package:inventi_coding_exam/widgets/button/iv_button_widget.dart';
import 'package:inventi_coding_exam/widgets/loading/generate_homepage_loading.dart';
import 'package:inventi_coding_exam/widgets/text/text_widget.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late HomepageBloc homepageBloc;
  String? _randomString;

  @override
  void initState() {
    homepageBloc = BlocProvider.of<HomepageBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: homepageBloc,
        builder: (context, state) {
          if (state is HomepageLoadingState) {
            return GenerateHomepageLoading();
          }

          if (state is HomepageLoadedState) {
            _randomString = state.data.randomString;
          }

          if (state is HomepageErrorState) {
            _randomString = state.errorMessage;
          }

          return Scaffold(
            backgroundColor: colorBrand25,
            appBar: AppBar(
              leadingWidth: 48,
              leading: Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 12),
                child: SvgPicture.asset(
                  'assets/icons/ic_menu_open.svg',
                  height: 36,
                  width: 36,
                ),
              ),
              backgroundColor: colorBrand25,
              title: SvgPicture.asset(
                'assets/images/img_appbar_logo.svg',
                width: 122.33,
                height: 36.62,
              ),
              centerTitle: false,
            ),
            body: Center(
              child: Container(
                height: 130,
                width: 369,
                decoration: BoxDecoration(
                  color: colorSecondary,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: colorBrand100, width: 1.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: IvButtonWidget(
                          type: ButtonType.secondary,
                          onPressed: () {
                            homepageBloc.add(GetRandomStringEvent());
                          },
                          buttonLabel: 'Quick Button'),
                    ),
                    Container(
                      height: 58,
                      width: 345,
                      decoration: BoxDecoration(
                        color: colorButton,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            (_randomString ?? '').isNotEmpty
                                ? BodyTextMedium(text: '"$_randomString"')
                                : SvgPicture.asset(
                                    'assets/icons/ic_build.svg',
                                    height: 24,
                                    width: 24,
                                  ),
                            BodyText(
                                text:
                                    'Click the button to generate new random string')
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
