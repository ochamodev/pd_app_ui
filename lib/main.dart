import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recycling_pal/page/main_menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF4CAF50),
          onPrimary: Color(0xFFFFFFFF),
          primaryContainer: Color(0xFFC8E6C9),
          onPrimaryContainer: Color(0xFF1B5E20),
          secondary: Color(0xFFFFC107),
          onSecondary: Color(0xFF000000),
          secondaryContainer: Color(0xFFFFF8E1),
          onSecondaryContainer: Color(0xFF3E2723),
          tertiary: Color(0xFF4FC3F7),
          onTertiary: Color(0xFFFFFFFF),
          tertiaryContainer: Color(0xFFE1F5FE),
          onTertiaryContainer: Color(0xFF01579B),
          surface: Color(0xFFFFFFFF),
          onSurface: Color(0xFF212121),
          surfaceContainerHighest: Color(0xFFE0E0E0),
          onSurfaceVariant: Color(0xFF424242),
          error: Color(0xFFD32F2F),
          onError: Color(0xFFFFFFFF),
          errorContainer: Color(0xFFF9DEDC),
          onErrorContainer: Color(0xFFB71C1C),
        ),
      ),
      home: MainMenu(),
    );
  }
}
