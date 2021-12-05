import 'package:dark_light_preference_provider_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ThemeNotifier(),
      builder: (context, child) {
        return Consumer<ThemeNotifier>(builder: (context, notifier, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: MyAppTheme.myThemes(notifier.isDark, context),
            home: const HomePage(),
          );
        });
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme App'),
      ),
      body: Center(
        child: Card(
          child: Consumer<ThemeNotifier>(builder: (context, notifier, _) {
            return SwitchListTile(
              secondary: notifier.isDark
                  ? const Icon(Icons.dark_mode)
                  : const Icon(Icons.light_mode),
              title: notifier.isDark
                  ? const Text('Dark Mode')
                  : const Text('Light Mode'),
              value: notifier.isDark,
              onChanged: (value) {
                notifier.toggleTheme(value);
              },
            );
          }),
        ),
      ),
    );
  }
}
