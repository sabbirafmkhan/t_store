import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/bindings/general_bindings.dart';
import 'package:t_store/routes/app_routes.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,

      /// - show loader or circular progress indicator meanwhile authentication repository is deciding to show relevant screen:
      home: Scaffold(
        backgroundColor: TColors.primary,
        body: Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }
}
