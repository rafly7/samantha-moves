import 'package:autorunweb/widgets/custom_webview.dart';
import 'package:flutter/material.dart';
import 'package:kiosk_mode/kiosk_mode.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late final Stream<KioskMode> currentMode = watchKioskMode();

  @override
  void initState() {
    // startKioskMode().whenComplete(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<KioskMode>(
      stream: currentMode,
      builder: (context, AsyncSnapshot<KioskMode> snapshot) {
        return ValueListenableBuilder(
          valueListenable: Hive.box<String>('WEBVIEW').listenable(),
          builder: (context, Box<String> value, child) {
            return CustomWebview(
              url: value.get('URL') ??  'https://moves.sinarmasmining.com/display',
            );
          },
        );
      },
    );
  }
}