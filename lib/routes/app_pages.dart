import 'package:get/get.dart';
import 'package:project_danso/screens/screens.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashScreen(),
      // binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeScreen(),
      // binding: SecondBinding(),
    ),
    GetPage(
      name: _Paths.MYPAGE,
      page: () => MyPageScreen(),
      // binding: SecondBinding(),
    ),
    GetPage(
      name: _Paths.DANSOHISTORY,
      page: () => HomeDansoHistoryScreen(),
      // binding: SecondBinding(),
    ),
    GetPage(
      name: _Paths.BASICLEARNING,
      page: () => HomeDansoBasicLearningScreen(),
      // binding: SecondBinding(),
    ),
    GetPage(
      name: _Paths.STEPBYSTEPANDTEST,
      page: () => HomeStepByStepAndTestScreen(),
      // binding: SecondBinding(),
    ),
    GetPage(
      name: _Paths.INSTRUMENTAL,
      page: () => InstrumentalListScreen(),
      // binding: SecondBinding(),
    ),
    GetPage(
      name: _Paths.QNA,
      page: () => QuestionsScreen(),
      // binding: SecondBinding(),
    ),
    GetPage(
      name: _Paths.STEPLEARNING,
      page: () => StepByStepScreen(),
      // binding: SecondBinding(),
    ),
  ];
}
