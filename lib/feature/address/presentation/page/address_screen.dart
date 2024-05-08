import 'package:auto_route/auto_route.dart';
import 'package:dummy_json/core/common_widgets/no_internet_screen.dart';
import 'package:dummy_json/core/routes/app_routes.gr.dart';
import 'package:dummy_json/core/utils/constants/colors_constants.dart';
import 'package:dummy_json/feature/address/presentation/bloc/profile_bloc.dart';
import 'package:dummy_json/feature/address/presentation/bloc/profile_event.dart';
import 'package:dummy_json/feature/address/presentation/bloc/profile_state.dart';
import 'package:dummy_json/feature/network/presentation/bloc/network_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBlackOff,
      appBar: AppBar(
        backgroundColor: kColorBlackOff,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: BlocBuilder<NetworkBloc, NetworkState>(
          builder: (context, state) {
            if (state is NetworkFailure) {
              return const NoInternetScreen();
            }
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView(
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: const [
                            AddressCard(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class AddressCard extends StatefulWidget {
  const AddressCard({super.key});

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(FetchProfileDataEvent());
  }

  var updatedData;
  bool isCall = false;

  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  //   print('didChangeDependencies ------------------------------');

  //   if (!_isDataFetched) {
  //     context.read<ProfileBloc>().add(FetchProfileDataEvent());
  //     _isDataFetched = true;
  //   }
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      if (updatedData != null && updatedData == 'updatedData') {
        if (!isCall) {
          context.read<ProfileBloc>().add(FetchProfileDataEvent());
          isCall = true;
        }
      }
      if (state is ProfileLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is ProfileLoadedState) {
        return Container(
          margin: EdgeInsets.only(top: 16.h, left: 24.w, right: 24.w),
          padding:
              EdgeInsets.only(top: 18.h, left: 16.w, right: 16.w, bottom: 24.h),
          decoration: BoxDecoration(
              color: const Color(0xff1C1E26),
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                    blurRadius: 2.r,
                    blurStyle: BlurStyle.solid,
                    color: const Color(0xff272931),
                    offset: const Offset(0, 4))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Address",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: kColorWhite,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                state.result!.address.toString(),
                style: TextStyle(
                  fontSize: 12.sp,
                  color: kSubTextColor,
                ),
              ),
              Text(
                '${state.result!.cityName.toString()} \n ${state.result!.stateName.toString()}',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: kSubTextColor,
                ),
              ),
              SizedBox(height: 16.h),
              const Divider(color: Color(0xff32343c)),
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: () async {
                  updatedData = await AutoRouter.of(context)
                      .push(const EditAddressScreenRoute());
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.edit_note_sharp,
                    color: Colors.white,
                    size: 20.h,
                  ),
                ),
              )
            ],
          ),
        );
      } else if (state is ProfileErrorState) {
        print("Got error: ${state}");
      }
      return const SizedBox.shrink();
    });
  }
}
