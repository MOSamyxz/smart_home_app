import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_app/core/services/cache_helper.dart';
import 'package:smart_home_app/generated/l10n.dart';
import 'package:smart_home_app/presentation/cubits/app/app_cubit.dart';
import 'package:smart_home_app/presentation/screens/auth/auth_screen.dart';
import 'firebase_options.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..init(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Smart Home App',
            debugShowCheckedModeBanner: false,
            locale:
                CacheHelper.sharedPreferences.getString('lang') == 'ar'
                    ? const Locale('ar')
                    : const Locale('en'),
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: ThemeData.dark(useMaterial3: true),
            home: LoginScreen(),
          );
        },
      ),
    );
  }
}
