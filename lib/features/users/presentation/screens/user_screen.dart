import 'package:clean_architecture/features/users/presentation/cubit/user_cubit.dart';
import 'package:clean_architecture/features/users/presentation/widgets/custom_search_bar.dart';
import 'package:clean_architecture/features/users/presentation/widgets/landing_widget.dart';
import 'package:clean_architecture/features/users/presentation/widgets/user_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: state is GetUserSuccess
              ? ListView(
                  children: [
                    const LandingWidget(),
                    UserData(user: state.user),
                    const CustomSearchBar(),
                  ],
                )
              : state is GetUserFailure
                  ? Text(state.message)
                  : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
