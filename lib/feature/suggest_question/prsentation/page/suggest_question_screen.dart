import 'package:auto_route/auto_route.dart';
import 'package:dummy_json/core/common/customTextField.dart';
import 'package:dummy_json/core/common/custom_long_btn.dart';
import 'package:dummy_json/core/common/toast.dart';
import 'package:dummy_json/core/routes/app_routes.gr.dart';
import 'package:dummy_json/core/utils/constants/colors_constants.dart';
import 'package:dummy_json/core/utils/validation/validation_mixin.dart';
import 'package:dummy_json/feature/suggest_question/prsentation/bloc/suggest_question_bloc.dart';
import 'package:dummy_json/feature/suggest_question/prsentation/bloc/suggest_question_event.dart';
import 'package:dummy_json/feature/suggest_question/prsentation/bloc/suggest_question_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SuggestQuestionScreen extends StatefulWidget {
  SuggestQuestionScreen({super.key});

  @override
  State<SuggestQuestionScreen> createState() => _SuggestQuestionScreenState();
}

class _SuggestQuestionScreenState extends State<SuggestQuestionScreen>
    with ValidationsMixin {
  GlobalKey<FormState> suggestQuestionFormKey = GlobalKey<FormState>();

  final questionTextController = TextEditingController();

  List<Widget> listWidgets = <Widget>[];
  List<TextEditingController> textControllers = <TextEditingController>[];
  // final suggestQuestionBloc = SuggestQuestionBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listWidgets = [
      const CustomTextfieldWidget(),
      const CustomTextfieldWidget()
    ];
    textControllers = [TextEditingController(), TextEditingController()];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    listWidgets.clear();
    textControllers.clear();
    // suggestQuestionBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kColorBlackOff,
      appBar: AppBar(
        backgroundColor: kColorBlackOff,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: BlocConsumer<SuggestQuestionBloc, SuggestQuestionState>(
          listener: (context, state) {
            if (state is QuestionErrorState) {
              print(state.message.toString());
              Toast().showToast(context, state.message.toString());
            } else if (state is SuggestQuestionSubmit) {
              Toast().showToast(context, 'Questions sent successfully');
              context.router.back();
            }
          },
          builder: (context, state) {
            if (state is SuggestQuestionInitialState) {
              print('Initial state excutes');
            } else if (state is ManageTextField) {
              if (state.listWidgets.isNotEmpty &&
                  state.textControllersList.isNotEmpty) {
                listWidgets.length = state.listWidgets.length;
                textControllers.length = state.textControllersList.length;
              }

              print(
                  "listwidgets : ${listWidgets.length} , TextControllers : ${textControllers.length}");
            }
            return Column(
              children: [
                //TextFields Content
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Form(
                        key: suggestQuestionFormKey,
                        child: Column(
                          children: [
                            SizedBox(height: 18.h),
                            ListView(
                              shrinkWrap: true,
                            
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Question',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: kColorWhite,
                                      ),
                                    ),
                                    SizedBox(height: 16.h),
                                    CustomTextfieldWidget(
                                      errorStyle: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      controller: questionTextController,
                                      hintText: 'Enter the question',
                                      style: TextStyle(
                                        color: kColorWhite,
                                        fontSize: 14.sp,
                                      ),
                                      hintStyle: TextStyle(
                                        fontSize: 14.sp,
                                        color: const Color(0xff84858D),
                                      ),
                                      textInputType: TextInputType.name,
                                      validator: validatedQuestion,
                                    ),
                                    SizedBox(height: 36.h),
                                    Text(
                                      'Options',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: kColorWhite,
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      'Please enter the available options',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: kColorWhite.withOpacity(0.75),
                                      ),
                                    ),
                                    SizedBox(height: 24.h),
                                  ],
                                ),
                              ],
                            ),
                            ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: listWidgets.length,
                              itemBuilder: (context, index) {
                                print('index no: $index');
                                return Column(
                                  children: [
                                    CustomTextfieldWidget(
                                      errorStyle: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      controller: textControllers[index],
                                      hintText: 'Option ${index + 1}',
                                      style: TextStyle(
                                        color: kColorWhite,
                                        fontSize: 14.sp,
                                      ),
                                      hintStyle: TextStyle(
                                        fontSize: 14.sp,
                                        color: kColorWhite.withOpacity(0.5),
                                      ),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          if (listWidgets.length <= 2) {
                                            return;
                                          } else {
                                            context
                                                .read<SuggestQuestionBloc>()
                                                .add(DeleteTextFiledEvent(
                                                    index));
                                          }
                                        },
                                        child: listWidgets.length <= 2
                                            ? SizedBox.shrink()
                                            : Container(
                                                margin: EdgeInsets.only(
                                                    right: 18.w),
                                                child: const Icon(Icons.close),
                                              ),
                                      ),
                                      textInputType: TextInputType.name,
                                      validator: validatedOptions,
                                    ),
                                    SizedBox(height: 16.h),
                                  ],
                                );
                              },
                            ),

                            // SizedBox(height: 16.h),

                            listWidgets.length < 7
                                ? GestureDetector(
                                    onTap: () {
                                      context.read<SuggestQuestionBloc>().add(
                                          AddNewTextFiledEvent(
                                              listWidgets, textControllers));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16.h, horizontal: 16.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: kColorGray,
                                          width: 1.w,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          Text(
                                            "Add more option",
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: kSubTextColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            SizedBox(height: 236.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomSheet: CustomLongButton(
        label: "Submit",
        onTap: () async {
          if (suggestQuestionFormKey.currentState!.validate()) {
            context.read<SuggestQuestionBloc>().add(SuggestQuestionSubmitEvent(
                questionTextController.text.toString(), textControllers));
          }
        },
      ),
    );
  }
}
