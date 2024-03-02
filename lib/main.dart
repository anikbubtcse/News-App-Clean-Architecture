import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/core/dependency_container.dart';
import 'package:news_app_clean_architecture/features/news/presentation/bloc/news_bloc.dart';
import 'package:news_app_clean_architecture/features/news/presentation/pages/news_description_page.dart';
import 'features/news/presentation/pages/home_page.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Future<void> main() async {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator<NewsBloc>()),
      ],
      child: GlobalLoaderOverlay(
        overlayColor: Colors.grey.withOpacity(0.8),
        useDefaultLoading: false,
        overlayWidgetBuilder: (_) {
          //ignored progress for the moment
          return Center(
            child: SpinKitSpinningLines(
              color: Colors.white,
              size: 80,
            ),
          );
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: HomePage.myHomePage,
          routes: {
            NewsDescriptionPage.newsDescriptionPage: (context) =>
                NewsDescriptionPage(),
            HomePage.myHomePage: (context) => HomePage(),
          },
        ),
      ),
    );
  }
}
