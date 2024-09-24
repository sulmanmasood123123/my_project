import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'Views/DashboardScreen/Provider/signOut_provider.dart';
import 'Views/ForgetPassword/Provider/forgetPassword_provider.dart';
import 'Views/LoginScreen/Provider/login_provider.dart';
import 'Views/RegisterScreen/Provider/register_provider.dart';
import 'Views/SplashScreen/splashScreen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => ForgotProvider()),
        ChangeNotifierProvider(create: (_) => SignOutProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 836),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
