import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing2/utils/routes/routes.dart';
import 'package:testing2/utils/routes/routes_names.dart';
import 'package:testing2/view_model/home_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>HomeProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesNames.intro,
      onGenerateRoute: Routes.generateRoutes,
    ),
    );
  }
}

