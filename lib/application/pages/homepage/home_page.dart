import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Application'),
      ),
      body: BlocProvider(
        create: (context) => HomeCubit(),
        child: HomeContent(),
      ),
    );
  }
}
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // context.read<HomeCubit>().navigateToCreatePage();
              },
              child: Text('Create Page'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // context.read<HomeCubit>().navigateToUserListPage();
              },
              child: Text('User List Page'),
            ),
          ],
        ),
      ),
    );
  }
}
