import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/view_model/cubits/News_cubit/news_cubit.dart';

import 'view/screens/homescreen/homescreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsCubit(),)
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
