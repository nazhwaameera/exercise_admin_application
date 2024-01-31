import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'cubit/user_list_cubit.dart'; // Import your cubit

class UserListContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserListCubit(), // Provide the UserListCubit
      child: BlocBuilder<UserListCubit, UserListState>(
        builder: (context, state) {
          if (state is UserListLoaded) {
            final users = state.users;

            return users.isEmpty
                ? Center(
              child: Text('No users. Create a user!'),
            )
                : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text(user.nama),
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // Add logic to delete user
                          context.read<UserListCubit>().deleteUser(user.id);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: () {
                          // Use Go Router for navigation to user detail page
                          GoRouter.of(context).go('/user/${user.id}');
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is UserListError) {
            return Center(
              child: Text('Error loading users: ${state.errorMessage}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
