import 'dart:developer';
import 'package:dio/dio.dart' as d;
import 'package:dio/dio.dart';
import 'package:dummy_json/core/utils/constants/string_constants.dart';
import 'package:dummy_json/core/utils/parent_model/abstract_model.dart';

class ApiHelper {
  // var isLoading = false.obs;
  var cancelToken = d.CancelToken();
  String? token;
  Future<T> callApi<T extends AbstractModel>({
    required String endPoint,
    String? apiUrl,
    Map<String, dynamic>? body,
    required Map<String, String> header,
    required String reqType,
    required T Function(Map<String, dynamic> json) fromJsonFunction,
    int? page,
    int? limit,
    bool? isShowSnackbar,
    // Map? extraBodyParam,
  }) async {
    log("API URL ${apiUrl.toString()}");
    // d.Dio dio = d.Dio();
    d.Dio dio = d.Dio(
      BaseOptions(
        validateStatus: (status) {
          return status == 307 || status! < 400;
        },
      ),
    );

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    var url = apiUrl ?? StringConstants.baseUrl;
    body = body ?? {};
    if (page != null) {
      body = {
        ...body,
        'page': page.toString(),
        'paginate': limit.toString(),
      };
    }
    print("body:$body");
    print(url + endPoint);
    var data = new d.FormData.fromMap(body);
    print(data.boundary);
    header['Content-Type'] = 'multipart/form-data; boundary=${data.boundary}';
    // header['Content-Type'] = 'application/json';
    print(data.files);
    try {
      d.Response response;
      // isLoading.value = true;
      if (reqType == 'get') {
        response = await dio.get(
          url + endPoint,
          options: d.Options(headers: header),
          queryParameters: body,
          cancelToken: cancelToken,
        );
      } else if (reqType == 'post') {
        response = await dio.post(url + endPoint,
            options: d.Options(headers: header),
            data: data,
            cancelToken: cancelToken);
      } else if (reqType == 'put') {
        response = await dio.put(url + endPoint,
            options: d.Options(headers: header),
            data: data,
            cancelToken: cancelToken);
      } else if (reqType == 'patch') {
        response = await dio.patch(url + endPoint,
            options: d.Options(headers: header),
            data: data,
            cancelToken: cancelToken);
      } else {
        response = await dio.delete(url + endPoint,
            options: d.Options(headers: header),
            data: data,
            cancelToken: cancelToken);
      }
      if (response.statusCode == 200) {
        // debugPrint(
        //     "success code--->${response.data['success']}----${body.toString()}");
        print(response.data);
        log("API SERVICE RESPONSE: ${response.data}");
        T model;
        if (response.data.runtimeType == List<dynamic>) {
          model = fromJsonFunction(response.data[0]);
        } else {
          model = fromJsonFunction(response.data);
        }
        // isLoading.value = false;
        // if (apiUrl != Const.pincodeApiURL) {
        //   token = await Utils().getToken();
        //   if (response.data['success'] == 4 && token == null) {
        //     Utils().deleteToken();

        //     log("IDHAR AAAYA ");
        //     Utils().showBottomSheetPopup(
        //       context: Get.context!,
        //       ic: Const().logoutIc,
        //       title: "Login?",
        //       description: response.data['message'],
        //       leftButtonName: "No, go back",
        //       rightButtonName: "Login",
        //       leftBtnBackgroundColor: Colors.transparent,
        //       rightBtnBackgroundColor: kColorPrimary,
        //       leftBorderColor: kColorPrimary,
        //       rightBorderColor: Colors.transparent,
        //       leftTextColor: kColorPrimary,
        //       rightTextColor: kColorWhite,
        //       leftBoxShadowColor: Colors.transparent,
        //       rightBoxShadowColor: Color(0xff3D2690),
        //       leftButtonHeight: 53.h,
        //       rightButtonHeight: 50.h,
        //       saveActionButtonPressed: () async {
        //         Get.back();
        //         Get.offAllNamed(AppRoutes.loginScreen);
        //       },
        //       cancelButtonPressed: () {
        //         Get.back();
        //       },
        //     );
        //     // Get.offAllNamed(AppRoutes.loginScreen);
        //   } else if (response.data['success'] == 4 && token != null) {
        //     Get.find<ProfileService>().profile.value = ProfileInfoModel();
        //     Get.offAllNamed(AppRoutes.loginScreen);
        //     Utils().deleteToken();
        //     Utils().deleteContests();
        //     Get.deleteAll();
        //     Get.find<ProfileService>().isGuest.value = false;
        //     await Get.find<StartupService>().fetchStartup();
        //     Utils().showSnackBar(Get.context, response.data['message']);
        //   }
        // }
        // if (isShowSnackbar == true) {
        //   if (response.data['success'] == 1) {
        //     Utils().showSnackBar(Get.context, response.data['message'],
        //         isSuccess: true);
        //   } else {
        //     Utils().showSnackBar(Get.context,
        //         response.data['message'] ?? response.data['Message']);
        //   }
        // }
        return model;
      }
    } catch (e) {
      T model;
      print(e);
      if (e is d.DioException) {
        if (e.response != null) {
          model = fromJsonFunction({
            'success': 10,
            'message':
                "The Error is ${e.response!.statusCode} ${e.response!.statusMessage})"
          });
          // Utils().showSnackBar(Get.context,
          //     '${e.response!.statusCode} ${e.response!.statusMessage}');
        } else {
          model = fromJsonFunction(
              {'success': 10, 'message': "The Error is ${e.message})"});
        }
      } else {
        model = fromJsonFunction({'success': 10, 'message': e.toString()});
      }
      // isLoading.value = false;
      return model;
    }
    return fromJsonFunction({});
  }
}
