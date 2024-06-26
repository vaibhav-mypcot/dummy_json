import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:dummy_json/core/common_widgets/customTextField.dart';
import 'package:dummy_json/core/common_widgets/custom_long_btn.dart';
import 'package:dummy_json/core/common_widgets/no_internet_screen.dart';
import 'package:dummy_json/core/utils/constants/colors_constants.dart';
import 'package:dummy_json/core/utils/validation/validation_mixin.dart';
import 'package:dummy_json/feature/address/presentation/bloc/profile_bloc.dart';
import 'package:dummy_json/feature/address/presentation/bloc/profile_event.dart';
import 'package:dummy_json/feature/address/presentation/bloc/profile_state.dart';
import 'package:dummy_json/feature/network/presentation/bloc/network_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({super.key});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen>
    with ValidationsMixin {
  GlobalKey<FormState> editAddressFormKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final pincodeController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(FetchProfileDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBlackOff,
      resizeToAvoidBottomInset: false,
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
                    physics: const PageScrollPhysics(),
                    child: BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, state) {
                      if (state is ProfileLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is ProfileLoadedState) {
                        if (nameController.text.isEmpty &&
                            addressController.text.isEmpty &&
                            pincodeController.text.isEmpty &&
                            stateController.text.isEmpty &&
                            cityController.text.isEmpty) {
                          nameController.text = state.result!.name.toString();
                          addressController.text =
                              state.result!.address.toString();
                          pincodeController.text =
                              state.result!.pinCode.toString();
                          stateController.text = state.result!.stateName!;
                          cityController.text = state.result!.cityName!;
                        }
                      } else if (state is PincodeUpdateState) {
                        stateController.text = state.postOffice.first.state!;
                        cityController.text = state.postOffice.first.district!;
                      }
                      return Column(
                        children: [
                          ListView(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: 36.h, left: 24.w, right: 24.w),
                                child: Form(
                                  key: editAddressFormKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //-- Name Field
                                      Text(
                                        'Name',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: kColorWhite,
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      CustomTextfieldWidget(
                                        validator: validatedName,
                                        errorStyle: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        controller: nameController,
                                        // initialValue:
                                        //     headValue() ? "Guest" : "",
                                        onChanged: (value) {
                                          if (nameController.text.isNotEmpty) {
                                            nameController.clear();
                                            print("value clear");
                                          }
                                          nameController.text = value;
                                        },
                                        hintText: 'Enter Name',
                                        hintStyle: TextStyle(
                                          fontSize: 14.sp,
                                          color: kSubTextColor,
                                        ),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: kSubTextColor,
                                        ),
                                        textInputType: TextInputType.name,
                                        maxLines: 1,
                                      ),
                                      SizedBox(height: 24.h),
                                      //-- Address Field
                                      Text(
                                        'Address',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: kColorWhite,
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      CustomTextfieldWidget(
                                        validator: validatedAddress,
                                        errorStyle: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        maxLines: null,
                                        // initialValue: headValue()
                                        //     ? '201, B11, Gardenia Phase 3, Yari Road Andheri, Near 7-11 International school'
                                        //     : "",
                                        hintText: 'Enter your address',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: kSubTextColor,
                                        ),
                                        controller: addressController,
                                        hintStyle: TextStyle(
                                          fontSize: 14.sp,
                                          color: kSubTextColor,
                                        ),
                                        textInputType: TextInputType.multiline,
                                      ),
                                      SizedBox(height: 24.h),
                                      //-- Address Field
                                      Text(
                                        'Pincode',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: kColorWhite,
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      CustomTextfieldWidget(
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(6),
                                        ],
                                        controller: pincodeController,
                                        validator: validatedPincode,
                                        errorStyle: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        maxLines: null,
                                        // initialValue:
                                        //     headValue() ? '400055' : "",
                                        hintText: 'Enter your pincode',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: kSubTextColor,
                                        ),
                                        hintStyle: TextStyle(
                                          fontSize: 14.sp,
                                          color: kSubTextColor,
                                        ),
                                        textInputType: TextInputType.number,
                                        onChanged: (String value) {
                                          if (value.isEmpty) {
                                            stateController.text = '';
                                            cityController.text = '';
                                          }
                                          if (value.length == 6) {
                                            context.read<ProfileBloc>().add(
                                                FetchPincodeEvent(
                                                    pincode: pincodeController
                                                        .text));
                                            // if (BlocProvider.of<ProfileBloc>(
                                            //         context)
                                            //     .state is PincodeUpdateState) {
                                            //   final state =
                                            //       BlocProvider.of<ProfileBloc>(
                                            //               context)
                                            //           .state as PincodeUpdateState;
                                            //   stateController.text =
                                            //       state.postOffice.first.state!;
                                            //   cityController.text =
                                            //       state.postOffice.first.district!;
                                            // }
                                          } else {
                                            print("Pincode is not complete");
                                            stateController.text = '';
                                            cityController.text = '';
                                          }
                                        },
                                      ),
                                      SizedBox(height: 24.h),
                                      //-- State Dropdown
                                      Text(
                                        'State',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: kColorWhite,
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      // DropDown(
                                      //   label: "Select State",
                                      //   dropDownList: editAddressController.stateList.value,
                                      // ),
                                      Container(
                                        // height: double.infinity,
                                        width: double.infinity,
                                        child: CustomTextfieldWidget(
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(6),
                                          ],
                                          controller: stateController,
                                          errorStyle: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          validator: validatedState,
                                          suffixIcon:
                                              stateController.text.isNotEmpty
                                                  ? null
                                                  : Container(
                                                      padding: EdgeInsets.only(
                                                          right: 10.w),
                                                      // width: 2.w,
                                                      // height: 2.w,
                                                      child: const Center(
                                                        child: CircularProgressIndicator(
                                                            color:
                                                                kColorPrimary),
                                                      ),
                                                    ),
                                          enabled: false,
                                          maxLines: null,
                                          // initialValue:
                                          //     headValue() ? '400055' : "",
                                          hintText: 'State Name',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: kSubTextColor,
                                          ),
                                          hintStyle: TextStyle(
                                            fontSize: 14.sp,
                                            color: kSubTextColor,
                                          ),
                                          textInputType: TextInputType.number,
                                        ),
                                      ),
                                      SizedBox(height: 24.h),
                                      // City Dropdown
                                      Text(
                                        'City',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: kColorWhite,
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      Container(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom +
                                                50.h),
                                        width: double.infinity,
                                        child: CustomTextfieldWidget(
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(6),
                                          ],
                                          validator: validatedCity,
                                          controller: cityController,
                                          enabled: false,
                                          suffixIcon:
                                              cityController.text.isNotEmpty
                                                  ? null
                                                  : Container(
                                                      padding: EdgeInsets.only(
                                                          right: 10.w),
                                                      // width: 2.w,
                                                      // height: 2.w,
                                                      child: const Center(
                                                        child: CircularProgressIndicator(
                                                            color:
                                                                kColorPrimary),
                                                      ),
                                                    ),
                                          // validator: validatedPincode,
                                          errorStyle: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          maxLines: null,
                                          // initialValue:
                                          //     headValue() ? '400055' : "",
                                          hintText: 'City Name',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: kSubTextColor,
                                          ),
                                          hintStyle: TextStyle(
                                            fontSize: 14.sp,
                                            color: kSubTextColor,
                                          ),
                                          textInputType: TextInputType.number,
                                        ),
                                      ),
                                      Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 100.h)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomSheet: CustomLongButton(
        label: "Save",
        onTap: () {
          context.read<ProfileBloc>().add(
                UserAddressUpdateEvent(
                  name: nameController.text,
                  address: addressController.text,
                  pincode: pincodeController.text,
                ),
              );
          AutoRouter.of(context).maybePop('updatedData');
        },
      ),
    );
  }
}
