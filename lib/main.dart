import 'package:flutter/material.dart' hide SearchController;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_discovery/core/helpers/app_colors.dart';
import 'package:movie_discovery/features/bottom/controller/bottom_bar_controller.dart';
import 'package:movie_discovery/features/coming_soon/controller/coming_soon_controller.dart';
import 'package:movie_discovery/features/home/controller/home_controller.dart';
import 'package:movie_discovery/features/splash/views/splash_screen.dart';
import 'package:movie_discovery/features/search/controller/search_controller.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  runApp(const MovieDiscovery());
}

class MovieDiscovery extends StatelessWidget {
  const MovieDiscovery({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomBarController()),
        ChangeNotifierProvider(create: (context) => HomeController()),
        ChangeNotifierProvider(create: (context) => SearchController()),
        ChangeNotifierProvider(create: (context) => ComingSoonController()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: '.SF Pro Display',
          scaffoldBackgroundColor: AppColors.primaryAppColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.primaryAppColor,
          ),
        ),
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
