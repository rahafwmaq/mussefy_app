import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mussefy_app/bloc/auth/authintcation_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_bloc.dart';
import 'package:mussefy_app/utilities/functions/supa_initilizer.dart';
import 'package:mussefy_app/views/onboarding_view/logo_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: ".env");
  supaInitializer();

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('ar', 'SA')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('ar', 'SA'),
        child: const MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthintcationBloc>(
          create: (context) => AuthintcationBloc(),
        ),
        BlocProvider<PatientBloc>(
          create: (context) => PatientBloc(),
        ),
      ],
      child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          home: const LogoView()),
    );
  }
}
