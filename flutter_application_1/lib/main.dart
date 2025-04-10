import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/product/presentation/bloc/productBloc.dart';
import 'package:flutter_application_1/features/product/presentation/bloc/product_event.dart';
import 'package:flutter_application_1/features/product/presentation/pages/main_screen.dart';
import 'package:flutter_application_1/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



void main() {
  setupDependencies();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<NavigationCubit>()),
        BlocProvider(create: (_) => sl<ProductBloc>()..add(FetchCategories())),
      ],
      child: MaterialApp(
        title: 'Swiftze',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        ),
        home: const MainScreen(),
      ),
    );
  }
}
