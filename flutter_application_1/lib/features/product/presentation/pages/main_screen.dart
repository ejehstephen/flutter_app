

import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/product/presentation/navigationbar/nav_bar.dart';
import 'package:flutter_application_1/features/product/presentation/pages/homepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

export 'package:flutter_application_1/features/product/presentation/navigationbar/nav_bar.dart' show NavigationCubit, NavigationState;

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.index,
            children: const [
              HomePage(),
              // Center(child: Text("inbox")),
              Center(child: Text('Cart Page ')),
              Center(child: Text('Profile Page')),
            ],
          ),
          bottomNavigationBar: const CustomNavigationBar(),
        );
      },
    );
  }
}
