import 'package:bloomsai/app/controller/provider/auth/auth_provider.dart';
import 'package:bloomsai/app/controller/provider/chat/settings_provider.dart';
import 'package:bloomsai/app/controller/provider/diagnose/diagnose_provider.dart';
import 'package:bloomsai/app/controller/provider/profile/profile_provider.dart';
import 'package:bloomsai/app/views/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'app/controller/provider/bottom_navbar/bottom_navbar.dart';
import 'app/controller/provider/chat/chat_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ChatProvider.initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, _, __) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>(
            create: (_) => AuthProvider(),
          ),
          ChangeNotifierProvider<BottomNavBarProvider>(
            create: (_) => BottomNavBarProvider(),
          ),
          ChangeNotifierProvider<ChatProvider>(
            create: (_) => ChatProvider(),
          ),
          ChangeNotifierProvider<SettingsProvider>(
            create: (_) => SettingsProvider(),
          ),
          ChangeNotifierProvider<ProfileProvider>(
            create: (_) => ProfileProvider(),
          ),
          ChangeNotifierProvider<DiagnoseProvider>(
            create: (_) => DiagnoseProvider(),
          ),
        ],
        child: const GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BloomsAI',
          home: SplashView(),
        ),
      );
    });
  }
}
