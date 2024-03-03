import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/paramedic_bloc.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/patent_bloc/patient_bloc.dart';
import 'package:paramedic_app/utilities/functions/supa_initilizer.dart';
import 'package:paramedic_app/view_layout/color.dart';
import 'package:paramedic_app/views/logo_view/logo_view.dart';

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
        BlocProvider<ParamedicBloc>(
          create: (context) => ParamedicBloc(),
        ),
        BlocProvider<PatientBloc>(
          create: (context) => PatientBloc(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
            fontFamily: 'Tajawal',
            iconTheme: const IconThemeData(color: red),
            iconButtonTheme: const IconButtonThemeData(
                style: ButtonStyle(iconColor: MaterialStatePropertyAll(red)))),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: const LogoView(),
      ),
    );
  }
}
