import 'package:auto_route/auto_route.dart';
import 'package:dummy_json/feature/users/presentation/bloc/user_bloc.dart';
import 'package:dummy_json/feature/users/presentation/bloc/user_event.dart';
import 'package:dummy_json/feature/users/presentation/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(FetchUserDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserInitialState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ShowUserDataState) {
                final user = state.user;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: user.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network(
                        user[index].image!,
                        fit: BoxFit.cover,
                        height: 30.h,
                        width: 30.w,
                      ),
                      title: Text(
                        user[index].firstName!,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        user[index].lastName!,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  },
                );
              }
              return SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
