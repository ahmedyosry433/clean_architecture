import 'package:clean_architecture/core/databases/cache/cache_helper.dart';
import 'package:clean_architecture/features/users/presentation/cubit/user_cubit.dart';
import 'package:clean_architecture/features/users/presentation/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => UserCubit()..eitherFailuerOrUser(1),
        child: const UserScreen(),
      ),
    );
  }
}
