// Mocks generated by Mockito 5.4.4 from annotations
// in dummy_json/test/helper/helper_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;
import 'dart:convert' as _i14;
import 'dart:typed_data' as _i15;

import 'package:dio/dio.dart' as _i2;
import 'package:dummy_json/core/services/api/api_helper.dart' as _i7;
import 'package:dummy_json/core/utils/header/headers.dart' as _i11;
import 'package:dummy_json/core/utils/parent_model/abstract_model.dart' as _i9;
import 'package:dummy_json/feature/address/data/model/pincode_model.dart'
    as _i6;
import 'package:dummy_json/feature/address/data/profile_model/profile_model.dart'
    as _i5;
import 'package:dummy_json/feature/address/data/profile_model/result.dart'
    as _i13;
import 'package:dummy_json/feature/address/data/repository/profile_repository.dart'
    as _i12;
import 'package:dummy_json/feature/address/data/services/profile_service.dart'
    as _i4;
import 'package:http/http.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i10;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCancelToken_0 extends _i1.SmartFake implements _i2.CancelToken {
  _FakeCancelToken_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFuture_1<T1> extends _i1.SmartFake implements _i3.Future<T1> {
  _FakeFuture_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeProfileServices_2 extends _i1.SmartFake
    implements _i4.ProfileServices {
  _FakeProfileServices_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeProfileModel_3 extends _i1.SmartFake implements _i5.ProfileModel {
  _FakeProfileModel_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePincodeModel_4 extends _i1.SmartFake implements _i6.PincodeModel {
  _FakePincodeModel_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeApiHelper_5 extends _i1.SmartFake implements _i7.ApiHelper {
  _FakeApiHelper_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_6 extends _i1.SmartFake implements _i8.Response {
  _FakeResponse_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_7 extends _i1.SmartFake
    implements _i8.StreamedResponse {
  _FakeStreamedResponse_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ApiHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiHelper extends _i1.Mock implements _i7.ApiHelper {
  MockApiHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.CancelToken get cancelToken => (super.noSuchMethod(
        Invocation.getter(#cancelToken),
        returnValue: _FakeCancelToken_0(
          this,
          Invocation.getter(#cancelToken),
        ),
      ) as _i2.CancelToken);

  @override
  set cancelToken(_i2.CancelToken? _cancelToken) => super.noSuchMethod(
        Invocation.setter(
          #cancelToken,
          _cancelToken,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set token(String? _token) => super.noSuchMethod(
        Invocation.setter(
          #token,
          _token,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.Future<T> callApi<T extends _i9.AbstractModel>({
    required String? endPoint,
    String? apiUrl,
    Map<String, dynamic>? body,
    required Map<String, String>? header,
    required String? reqType,
    required T Function(Map<String, dynamic>)? fromJsonFunction,
    int? page,
    int? limit,
    bool? isShowSnackbar,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #callApi,
          [],
          {
            #endPoint: endPoint,
            #apiUrl: apiUrl,
            #body: body,
            #header: header,
            #reqType: reqType,
            #fromJsonFunction: fromJsonFunction,
            #page: page,
            #limit: limit,
            #isShowSnackbar: isShowSnackbar,
          },
        ),
        returnValue: _i10.ifNotNull(
              _i10.dummyValueOrNull<T>(
                this,
                Invocation.method(
                  #callApi,
                  [],
                  {
                    #endPoint: endPoint,
                    #apiUrl: apiUrl,
                    #body: body,
                    #header: header,
                    #reqType: reqType,
                    #fromJsonFunction: fromJsonFunction,
                    #page: page,
                    #limit: limit,
                    #isShowSnackbar: isShowSnackbar,
                  },
                ),
              ),
              (T v) => _i3.Future<T>.value(v),
            ) ??
            _FakeFuture_1<T>(
              this,
              Invocation.method(
                #callApi,
                [],
                {
                  #endPoint: endPoint,
                  #apiUrl: apiUrl,
                  #body: body,
                  #header: header,
                  #reqType: reqType,
                  #fromJsonFunction: fromJsonFunction,
                  #page: page,
                  #limit: limit,
                  #isShowSnackbar: isShowSnackbar,
                },
              ),
            ),
      ) as _i3.Future<T>);
}

/// A class which mocks [Header].
///
/// See the documentation for Mockito's code generation for more information.
class MockHeader extends _i1.Mock implements _i11.Header {
  MockHeader() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get accessToken => (super.noSuchMethod(
        Invocation.getter(#accessToken),
        returnValue: _i10.dummyValue<String>(
          this,
          Invocation.getter(#accessToken),
        ),
      ) as String);

  @override
  set accessToken(String? _accessToken) => super.noSuchMethod(
        Invocation.setter(
          #accessToken,
          _accessToken,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String generateBoundary() => (super.noSuchMethod(
        Invocation.method(
          #generateBoundary,
          [],
        ),
        returnValue: _i10.dummyValue<String>(
          this,
          Invocation.method(
            #generateBoundary,
            [],
          ),
        ),
      ) as String);
}

/// A class which mocks [ProfileRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockProfileRepository extends _i1.Mock implements _i12.ProfileRepository {
  MockProfileRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.ProfileServices get profileServices => (super.noSuchMethod(
        Invocation.getter(#profileServices),
        returnValue: _FakeProfileServices_2(
          this,
          Invocation.getter(#profileServices),
        ),
      ) as _i4.ProfileServices);

  @override
  _i3.Future<_i5.ProfileModel> fetchProfileData() => (super.noSuchMethod(
        Invocation.method(
          #fetchProfileData,
          [],
        ),
        returnValue: _i3.Future<_i5.ProfileModel>.value(_FakeProfileModel_3(
          this,
          Invocation.method(
            #fetchProfileData,
            [],
          ),
        )),
      ) as _i3.Future<_i5.ProfileModel>);

  @override
  _i3.Future<_i5.ProfileModel> updateUserAddressData(
    String? name,
    String? address,
    String? pinCode,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateUserAddressData,
          [
            name,
            address,
            pinCode,
          ],
        ),
        returnValue: _i3.Future<_i5.ProfileModel>.value(_FakeProfileModel_3(
          this,
          Invocation.method(
            #updateUserAddressData,
            [
              name,
              address,
              pinCode,
            ],
          ),
        )),
      ) as _i3.Future<_i5.ProfileModel>);

  @override
  _i3.Future<_i6.PincodeModel> fetchByPincode(String? pinCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchByPincode,
          [pinCode],
        ),
        returnValue: _i3.Future<_i6.PincodeModel>.value(_FakePincodeModel_4(
          this,
          Invocation.method(
            #fetchByPincode,
            [pinCode],
          ),
        )),
      ) as _i3.Future<_i6.PincodeModel>);
}

/// A class which mocks [ProfileServices].
///
/// See the documentation for Mockito's code generation for more information.
class MockProfileServices extends _i1.Mock implements _i4.ProfileServices {
  MockProfileServices() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.ApiHelper get apiHelper => (super.noSuchMethod(
        Invocation.getter(#apiHelper),
        returnValue: _FakeApiHelper_5(
          this,
          Invocation.getter(#apiHelper),
        ),
      ) as _i7.ApiHelper);

  @override
  set apiHelper(_i7.ApiHelper? _apiHelper) => super.noSuchMethod(
        Invocation.setter(
          #apiHelper,
          _apiHelper,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get token => (super.noSuchMethod(
        Invocation.getter(#token),
        returnValue: _i10.dummyValue<String>(
          this,
          Invocation.getter(#token),
        ),
      ) as String);

  @override
  set token(String? _token) => super.noSuchMethod(
        Invocation.setter(
          #token,
          _token,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.Future<_i5.ProfileModel> getProfileData() => (super.noSuchMethod(
        Invocation.method(
          #getProfileData,
          [],
        ),
        returnValue: _i3.Future<_i5.ProfileModel>.value(_FakeProfileModel_3(
          this,
          Invocation.method(
            #getProfileData,
            [],
          ),
        )),
      ) as _i3.Future<_i5.ProfileModel>);

  @override
  _i3.Future<_i5.ProfileModel> updateUserAddress(
    String? name,
    String? address,
    String? pinCode,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateUserAddress,
          [
            name,
            address,
            pinCode,
          ],
        ),
        returnValue: _i3.Future<_i5.ProfileModel>.value(_FakeProfileModel_3(
          this,
          Invocation.method(
            #updateUserAddress,
            [
              name,
              address,
              pinCode,
            ],
          ),
        )),
      ) as _i3.Future<_i5.ProfileModel>);

  @override
  _i3.Future<_i6.PincodeModel> getPincode(String? pincode) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPincode,
          [pincode],
        ),
        returnValue: _i3.Future<_i6.PincodeModel>.value(_FakePincodeModel_4(
          this,
          Invocation.method(
            #getPincode,
            [pincode],
          ),
        )),
      ) as _i3.Future<_i6.PincodeModel>);
}

/// A class which mocks [Result].
///
/// See the documentation for Mockito's code generation for more information.
class MockResult extends _i1.Mock implements _i13.Result {
  MockResult() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set id(int? _id) => super.noSuchMethod(
        Invocation.setter(
          #id,
          _id,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set name(String? _name) => super.noSuchMethod(
        Invocation.setter(
          #name,
          _name,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set phoneCode(String? _phoneCode) => super.noSuchMethod(
        Invocation.setter(
          #phoneCode,
          _phoneCode,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set phone(String? _phone) => super.noSuchMethod(
        Invocation.setter(
          #phone,
          _phone,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set gender(String? _gender) => super.noSuchMethod(
        Invocation.setter(
          #gender,
          _gender,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set dob(String? _dob) => super.noSuchMethod(
        Invocation.setter(
          #dob,
          _dob,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set address(String? _address) => super.noSuchMethod(
        Invocation.setter(
          #address,
          _address,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set pinCode(String? _pinCode) => super.noSuchMethod(
        Invocation.setter(
          #pinCode,
          _pinCode,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set cityName(String? _cityName) => super.noSuchMethod(
        Invocation.setter(
          #cityName,
          _cityName,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set stateName(String? _stateName) => super.noSuchMethod(
        Invocation.setter(
          #stateName,
          _stateName,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set fcmNotification(bool? _fcmNotification) => super.noSuchMethod(
        Invocation.setter(
          #fcmNotification,
          _fcmNotification,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set userImage(String? _userImage) => super.noSuchMethod(
        Invocation.setter(
          #userImage,
          _userImage,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set countryName(String? _countryName) => super.noSuchMethod(
        Invocation.setter(
          #countryName,
          _countryName,
        ),
        returnValueForMissingStub: null,
      );

  @override
  Map<String, dynamic> toJson() => (super.noSuchMethod(
        Invocation.method(
          #toJson,
          [],
        ),
        returnValue: <String, dynamic>{},
      ) as Map<String, dynamic>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i8.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i8.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i3.Future<_i8.Response>.value(_FakeResponse_6(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i3.Future<_i8.Response>);

  @override
  _i3.Future<_i8.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i3.Future<_i8.Response>.value(_FakeResponse_6(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i3.Future<_i8.Response>);

  @override
  _i3.Future<_i8.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i14.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i3.Future<_i8.Response>.value(_FakeResponse_6(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i3.Future<_i8.Response>);

  @override
  _i3.Future<_i8.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i14.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i3.Future<_i8.Response>.value(_FakeResponse_6(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i3.Future<_i8.Response>);

  @override
  _i3.Future<_i8.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i14.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i3.Future<_i8.Response>.value(_FakeResponse_6(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i3.Future<_i8.Response>);

  @override
  _i3.Future<_i8.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i14.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i3.Future<_i8.Response>.value(_FakeResponse_6(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i3.Future<_i8.Response>);

  @override
  _i3.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i3.Future<String>.value(_i10.dummyValue<String>(
          this,
          Invocation.method(
            #read,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i3.Future<String>);

  @override
  _i3.Future<_i15.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i3.Future<_i15.Uint8List>.value(_i15.Uint8List(0)),
      ) as _i3.Future<_i15.Uint8List>);

  @override
  _i3.Future<_i8.StreamedResponse> send(_i8.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i3.Future<_i8.StreamedResponse>.value(_FakeStreamedResponse_7(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i3.Future<_i8.StreamedResponse>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
