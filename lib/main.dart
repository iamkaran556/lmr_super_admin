import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth/login_controller.dart';
import 'auth/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aheadly',
        // theme:
        // ThemeData(
        //   brightness: Brightness.dark,
        //   primaryColor: const Color(0xFF1DB954), // Spotify Green
        //   scaffoldBackgroundColor: Colors.black,
        //   appBarTheme: AppBarTheme(
        //     backgroundColor: Colors.black,
        //     foregroundColor: Colors.white,
        //   ),
        //   floatingActionButtonTheme: FloatingActionButtonThemeData(
        //     backgroundColor: const Color(0xFF1DB954),
        //   ),
        //   textTheme: const TextTheme(
        //     bodyMedium: TextStyle(color: Colors.white), // Correct parameter name
        //     headlineMedium: TextStyle(color: Colors.white),
        //   ),
        // ),

          theme: ThemeData(
            useMaterial3: true,
            colorScheme: darkColorScheme,
            cupertinoOverrideTheme: const CupertinoThemeData(
              brightness: Brightness.light,
              textTheme: CupertinoTextThemeData(
                textStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),

        home:LoginView(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFFFFFFF),
  onPrimary: Color(0xFF3B2F00),
  primaryContainer: Color(0xFF554500),
  onPrimaryContainer: Color(0xFFFFE17A),
  secondary: Color(0xFFD3C6A1),
  onSecondary: Color(0xFF383016),
  secondaryContainer: Color(0xFF4F462A),
  onSecondaryContainer: Color(0xFFF0E2BB),
  tertiary: Color(0xFFABD0B0),
  onTertiary: Color(0xFF173721),
  tertiaryContainer: Color(0xFF2E4E36),
  onTertiaryContainer: Color(0xFFC6ECCB),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  surface: Color(0xFF1D1B16),
  onSurface: Color(0xFFE8E2D9),
  surfaceContainerHighest: Color(0xFF4B4639),
  onSurfaceVariant: Color(0xFFCEC6B4),
  outline: Color(0xFF979080),
  onInverseSurface: Color(0xFF1D1B16),
  inverseSurface: Color(0xFFE8E2D9),
  inversePrimary: Color(0xFF715C00),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFE5C449),
  outlineVariant: Color(0xFF4B4639),
  scrim: Color(0xFF000000),
);
