import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/form/form_bind.dart';
import 'modules/form/form_page.dart';
import 'modules/home/home_bind.dart';
import 'modules/home/home_page.dart';

void main() => runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      defaultTransition: Transition.native,
      locale: Locale('pt', 'BR'),
      getPages: [
        GetPage(
          name: '/home',
          page: () => HomePage(),
          binding: HomeBind(),
        ),
        GetPage(
          name: '/form',
          page: () => FormPage(),
          binding: FormBind(),
        ),
      ],
    ));
