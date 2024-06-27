import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spending_tracker/view/spendings_screen.dart';

final kColorSheme = ColorScheme.fromSeed(
  seedColor: Colors.green.shade200,
);
final kDarkColorSheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Colors.green.shade200,
);
const kCardMargin = EdgeInsets.symmetric(
  horizontal: 8,
  vertical: 4,
);

void main() {
  //prevents the application from running in landscape mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  ).then((_) {
    runApp(const MainApp());
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorSheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkColorSheme.primaryContainer,
          foregroundColor: kDarkColorSheme.onPrimaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorSheme.secondaryContainer,
          margin: kCardMargin,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorSheme.primaryContainer,
            foregroundColor: kDarkColorSheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kDarkColorSheme.onSecondaryContainer,
                fontSize: 16,
              ),
              titleMedium: TextStyle(
                color: kDarkColorSheme.onSecondaryContainer,
              ),
              titleSmall: TextStyle(
                color: kDarkColorSheme.onSecondaryContainer,
              ),
              bodyLarge: TextStyle(
                color: kDarkColorSheme.onSecondaryContainer,
              ),
              bodyMedium: TextStyle(
                color: kDarkColorSheme.onSecondaryContainer,
              ),
              bodySmall: TextStyle(
                color: kDarkColorSheme.onSecondaryContainer,
              ),
              labelLarge: TextStyle(
                color: kDarkColorSheme.onSecondaryContainer,
              ),
              labelMedium: TextStyle(
                color: kDarkColorSheme.onSecondaryContainer,
              ),
              labelSmall: TextStyle(
                color: kDarkColorSheme.onSecondaryContainer,
              ),
              displayLarge: TextStyle(
                color: kDarkColorSheme.onSecondaryContainer,
              ),
              displayMedium: TextStyle(
                color: kDarkColorSheme.onSecondaryContainer,
              ),
              displaySmall: TextStyle(
                color: kDarkColorSheme.onSecondaryContainer,
              ),
              headlineLarge: TextStyle(
                color: kDarkColorSheme.onSecondaryContainer,
              ),
              headlineMedium: TextStyle(
                color: kDarkColorSheme.onSecondaryContainer,
              ),
              headlineSmall: TextStyle(
                color: kDarkColorSheme.onSecondaryContainer,
              ),
            ),
      ),
      theme: ThemeData(
        colorScheme: kColorSheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorSheme.primaryContainer,
          foregroundColor: kColorSheme.onPrimaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorSheme.secondaryContainer,
          margin: kCardMargin,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorSheme.primaryContainer,
            foregroundColor: kColorSheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorSheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
      ),
      home: const SpendingsScreen(),
    );
  }
}
