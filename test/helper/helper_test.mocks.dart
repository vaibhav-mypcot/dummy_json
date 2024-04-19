// Mocks generated by Mockito 5.4.4 from annotations
// in dummy_json/test/helper/helper_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;
import 'dart:convert' as _i9;
import 'dart:typed_data' as _i10;

import 'package:dio/dio.dart' as _i2;
import 'package:dummy_json/core/services/api/api_helper.dart' as _i5;
import 'package:dummy_json/core/utils/header/headers.dart' as _i8;
import 'package:dummy_json/core/utils/parent_model/abstract_model.dart' as _i6;
import 'package:http/http.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;

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

class _FakeResponse_2 extends _i1.SmartFake implements _i4.Response {
  _FakeResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_3 extends _i1.SmartFake
    implements _i4.StreamedResponse {
  _FakeStreamedResponse_3(
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
class MockApiHelper extends _i1.Mock implements _i5.ApiHelper {
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
  _i3.Future<T> callApi<T extends _i6.AbstractModel>({
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
        returnValue: _i7.ifNotNull(
              _i7.dummyValueOrNull<T>(
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
class MockHeader extends _i1.Mock implements _i8.Header {
  MockHeader() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get accessToken => (super.noSuchMethod(
        Invocation.getter(#accessToken),
        returnValue: _i7.dummyValue<String>(
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
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.method(
            #generateBoundary,
            [],
          ),
        ),
      ) as String);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i4.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i3.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i3.Future<_i4.Response>);

  @override
  _i3.Future<_i4.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i3.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i3.Future<_i4.Response>);

  @override
  _i3.Future<_i4.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i9.Encoding? encoding,
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
        returnValue: _i3.Future<_i4.Response>.value(_FakeResponse_2(
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
      ) as _i3.Future<_i4.Response>);

  @override
  _i3.Future<_i4.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i9.Encoding? encoding,
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
        returnValue: _i3.Future<_i4.Response>.value(_FakeResponse_2(
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
      ) as _i3.Future<_i4.Response>);

  @override
  _i3.Future<_i4.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i9.Encoding? encoding,
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
        returnValue: _i3.Future<_i4.Response>.value(_FakeResponse_2(
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
      ) as _i3.Future<_i4.Response>);

  @override
  _i3.Future<_i4.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i9.Encoding? encoding,
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
        returnValue: _i3.Future<_i4.Response>.value(_FakeResponse_2(
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
      ) as _i3.Future<_i4.Response>);

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
        returnValue: _i3.Future<String>.value(_i7.dummyValue<String>(
          this,
          Invocation.method(
            #read,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i3.Future<String>);

  @override
  _i3.Future<_i10.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i3.Future<_i10.Uint8List>.value(_i10.Uint8List(0)),
      ) as _i3.Future<_i10.Uint8List>);

  @override
  _i3.Future<_i4.StreamedResponse> send(_i4.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i3.Future<_i4.StreamedResponse>.value(_FakeStreamedResponse_3(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i3.Future<_i4.StreamedResponse>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
