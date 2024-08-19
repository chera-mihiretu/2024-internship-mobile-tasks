// Mocks generated by Mockito 5.4.4 from annotations
// in ecommerce_app/test/test_helper/test_helper_generation.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:convert' as _i22;
import 'dart:typed_data' as _i24;

import 'package:dartz/dartz.dart' as _i2;
import 'package:ecommerce_app/core/errors/failures/failure.dart' as _i8;
import 'package:ecommerce_app/core/network/network_info.dart' as _i10;
import 'package:ecommerce_app/features/auth/data/data_source/remote_auth_data_source.dart'
    as _i21;
import 'package:ecommerce_app/features/auth/domain/entities/user_entity.dart'
    as _i20;
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart'
    as _i19;
import 'package:ecommerce_app/features/product/data/data_resources/local_product_data_source.dart'
    as _i12;
import 'package:ecommerce_app/features/product/data/data_resources/remote_product_data_source.dart'
    as _i11;
import 'package:ecommerce_app/features/product/data/models/product_model.dart'
    as _i3;
import 'package:ecommerce_app/features/product/domain/entities/product.dart'
    as _i9;
import 'package:ecommerce_app/features/product/domain/repositories/product_repository.dart'
    as _i5;
import 'package:ecommerce_app/features/product/domain/usecases/delete_product_usecase.dart'
    as _i18;
import 'package:ecommerce_app/features/product/domain/usecases/get_all_products_usecase.dart'
    as _i14;
import 'package:ecommerce_app/features/product/domain/usecases/get_product_usecase.dart'
    as _i15;
import 'package:ecommerce_app/features/product/domain/usecases/insert_product_usecase.dart'
    as _i17;
import 'package:ecommerce_app/features/product/domain/usecases/update_product_usecase.dart'
    as _i16;
import 'package:http/http.dart' as _i6;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i23;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

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

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeProductModel_1 extends _i1.SmartFake implements _i3.ProductModel {
  _FakeProductModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDuration_2 extends _i1.SmartFake implements Duration {
  _FakeDuration_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAddressCheckResult_3 extends _i1.SmartFake
    implements _i4.AddressCheckResult {
  _FakeAddressCheckResult_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeProductRepository_4 extends _i1.SmartFake
    implements _i5.ProductRepository {
  _FakeProductRepository_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_5 extends _i1.SmartFake implements _i6.Response {
  _FakeResponse_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_6 extends _i1.SmartFake
    implements _i6.StreamedResponse {
  _FakeStreamedResponse_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ProductRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductRepository extends _i1.Mock implements _i5.ProductRepository {
  MockProductRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Either<_i8.Failure, int>> deleteProduct(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteProduct,
          [id],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, int>>.value(
            _FakeEither_0<_i8.Failure, int>(
          this,
          Invocation.method(
            #deleteProduct,
            [id],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, int>>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, int>> updateProduct(
          _i9.ProductEntity? product) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateProduct,
          [product],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, int>>.value(
            _FakeEither_0<_i8.Failure, int>(
          this,
          Invocation.method(
            #updateProduct,
            [product],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, int>>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.ProductEntity>>>
      getAllProducts() => (super.noSuchMethod(
            Invocation.method(
              #getAllProducts,
              [],
            ),
            returnValue: _i7
                .Future<_i2.Either<_i8.Failure, List<_i9.ProductEntity>>>.value(
                _FakeEither_0<_i8.Failure, List<_i9.ProductEntity>>(
              this,
              Invocation.method(
                #getAllProducts,
                [],
              ),
            )),
          ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.ProductEntity>>>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, _i9.ProductEntity>> getProduct(
          String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProduct,
          [id],
        ),
        returnValue:
            _i7.Future<_i2.Either<_i8.Failure, _i9.ProductEntity>>.value(
                _FakeEither_0<_i8.Failure, _i9.ProductEntity>(
          this,
          Invocation.method(
            #getProduct,
            [id],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, _i9.ProductEntity>>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, int>> insertProduct(
          _i9.ProductEntity? product) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertProduct,
          [product],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, int>>.value(
            _FakeEither_0<_i8.Failure, int>(
          this,
          Invocation.method(
            #insertProduct,
            [product],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, int>>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i10.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
}

/// A class which mocks [RemoteProductDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoteProductDataSource extends _i1.Mock
    implements _i11.RemoteProductDataSource {
  MockRemoteProductDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<int> deleteProduct(String? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteProduct,
          [id],
        ),
        returnValue: _i7.Future<int>.value(0),
      ) as _i7.Future<int>);

  @override
  _i7.Future<List<_i3.ProductModel>> getAllProducts() => (super.noSuchMethod(
        Invocation.method(
          #getAllProducts,
          [],
        ),
        returnValue:
            _i7.Future<List<_i3.ProductModel>>.value(<_i3.ProductModel>[]),
      ) as _i7.Future<List<_i3.ProductModel>>);

  @override
  _i7.Future<_i3.ProductModel> getProduct(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getProduct,
          [id],
        ),
        returnValue: _i7.Future<_i3.ProductModel>.value(_FakeProductModel_1(
          this,
          Invocation.method(
            #getProduct,
            [id],
          ),
        )),
      ) as _i7.Future<_i3.ProductModel>);

  @override
  _i7.Future<int> insertProduct(_i3.ProductModel? productModel) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertProduct,
          [productModel],
        ),
        returnValue: _i7.Future<int>.value(0),
      ) as _i7.Future<int>);

  @override
  _i7.Future<int> updateProduct(_i3.ProductModel? productModel) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateProduct,
          [productModel],
        ),
        returnValue: _i7.Future<int>.value(0),
      ) as _i7.Future<int>);
}

/// A class which mocks [LocalProductDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalProductDataSource extends _i1.Mock
    implements _i12.LocalProductDataSource {
  MockLocalProductDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<List<_i3.ProductModel>> getAllProducts() => (super.noSuchMethod(
        Invocation.method(
          #getAllProducts,
          [],
        ),
        returnValue:
            _i7.Future<List<_i3.ProductModel>>.value(<_i3.ProductModel>[]),
      ) as _i7.Future<List<_i3.ProductModel>>);

  @override
  _i7.Future<_i3.ProductModel> getProduct(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getProduct,
          [id],
        ),
        returnValue: _i7.Future<_i3.ProductModel>.value(_FakeProductModel_1(
          this,
          Invocation.method(
            #getProduct,
            [id],
          ),
        )),
      ) as _i7.Future<_i3.ProductModel>);

  @override
  _i7.Future<void> addProduct(_i3.ProductModel? model) => (super.noSuchMethod(
        Invocation.method(
          #addProduct,
          [model],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> addListOfProduct(List<_i3.ProductModel>? models) =>
      (super.noSuchMethod(
        Invocation.method(
          #addListOfProduct,
          [models],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> removeProduct(String? id) => (super.noSuchMethod(
        Invocation.method(
          #removeProduct,
          [id],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> updateProduct(_i3.ProductModel? model) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateProduct,
          [model],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
}

/// A class which mocks [InternetConnectionChecker].
///
/// See the documentation for Mockito's code generation for more information.
class MockInternetConnectionChecker extends _i1.Mock
    implements _i4.InternetConnectionChecker {
  MockInternetConnectionChecker() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Duration get checkInterval => (super.noSuchMethod(
        Invocation.getter(#checkInterval),
        returnValue: _FakeDuration_2(
          this,
          Invocation.getter(#checkInterval),
        ),
      ) as Duration);

  @override
  Duration get checkTimeout => (super.noSuchMethod(
        Invocation.getter(#checkTimeout),
        returnValue: _FakeDuration_2(
          this,
          Invocation.getter(#checkTimeout),
        ),
      ) as Duration);

  @override
  List<_i4.AddressCheckOptions> get addresses => (super.noSuchMethod(
        Invocation.getter(#addresses),
        returnValue: <_i4.AddressCheckOptions>[],
      ) as List<_i4.AddressCheckOptions>);

  @override
  set addresses(List<_i4.AddressCheckOptions>? value) => super.noSuchMethod(
        Invocation.setter(
          #addresses,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i7.Future<bool> get hasConnection => (super.noSuchMethod(
        Invocation.getter(#hasConnection),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);

  @override
  _i7.Future<_i4.InternetConnectionStatus> get connectionStatus =>
      (super.noSuchMethod(
        Invocation.getter(#connectionStatus),
        returnValue: _i7.Future<_i4.InternetConnectionStatus>.value(
            _i4.InternetConnectionStatus.connected),
      ) as _i7.Future<_i4.InternetConnectionStatus>);

  @override
  _i7.Stream<_i4.InternetConnectionStatus> get onStatusChange =>
      (super.noSuchMethod(
        Invocation.getter(#onStatusChange),
        returnValue: _i7.Stream<_i4.InternetConnectionStatus>.empty(),
      ) as _i7.Stream<_i4.InternetConnectionStatus>);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  bool get isActivelyChecking => (super.noSuchMethod(
        Invocation.getter(#isActivelyChecking),
        returnValue: false,
      ) as bool);

  @override
  _i7.Future<_i4.AddressCheckResult> isHostReachable(
          _i4.AddressCheckOptions? options) =>
      (super.noSuchMethod(
        Invocation.method(
          #isHostReachable,
          [options],
        ),
        returnValue:
            _i7.Future<_i4.AddressCheckResult>.value(_FakeAddressCheckResult_3(
          this,
          Invocation.method(
            #isHostReachable,
            [options],
          ),
        )),
      ) as _i7.Future<_i4.AddressCheckResult>);
}

/// A class which mocks [SharedPreferences].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreferences extends _i1.Mock implements _i13.SharedPreferences {
  MockSharedPreferences() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Set<String> getKeys() => (super.noSuchMethod(
        Invocation.method(
          #getKeys,
          [],
        ),
        returnValue: <String>{},
      ) as Set<String>);

  @override
  Object? get(String? key) => (super.noSuchMethod(Invocation.method(
        #get,
        [key],
      )) as Object?);

  @override
  bool? getBool(String? key) => (super.noSuchMethod(Invocation.method(
        #getBool,
        [key],
      )) as bool?);

  @override
  int? getInt(String? key) => (super.noSuchMethod(Invocation.method(
        #getInt,
        [key],
      )) as int?);

  @override
  double? getDouble(String? key) => (super.noSuchMethod(Invocation.method(
        #getDouble,
        [key],
      )) as double?);

  @override
  String? getString(String? key) => (super.noSuchMethod(Invocation.method(
        #getString,
        [key],
      )) as String?);

  @override
  bool containsKey(String? key) => (super.noSuchMethod(
        Invocation.method(
          #containsKey,
          [key],
        ),
        returnValue: false,
      ) as bool);

  @override
  List<String>? getStringList(String? key) =>
      (super.noSuchMethod(Invocation.method(
        #getStringList,
        [key],
      )) as List<String>?);

  @override
  _i7.Future<bool> setBool(
    String? key,
    bool? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setBool,
          [
            key,
            value,
          ],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);

  @override
  _i7.Future<bool> setInt(
    String? key,
    int? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setInt,
          [
            key,
            value,
          ],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);

  @override
  _i7.Future<bool> setDouble(
    String? key,
    double? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setDouble,
          [
            key,
            value,
          ],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);

  @override
  _i7.Future<bool> setString(
    String? key,
    String? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setString,
          [
            key,
            value,
          ],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);

  @override
  _i7.Future<bool> setStringList(
    String? key,
    List<String>? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setStringList,
          [
            key,
            value,
          ],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);

  @override
  _i7.Future<bool> remove(String? key) => (super.noSuchMethod(
        Invocation.method(
          #remove,
          [key],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);

  @override
  _i7.Future<bool> commit() => (super.noSuchMethod(
        Invocation.method(
          #commit,
          [],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);

  @override
  _i7.Future<bool> clear() => (super.noSuchMethod(
        Invocation.method(
          #clear,
          [],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);

  @override
  _i7.Future<void> reload() => (super.noSuchMethod(
        Invocation.method(
          #reload,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
}

/// A class which mocks [GetAllProductUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetAllProductUseCase extends _i1.Mock
    implements _i14.GetAllProductUseCase {
  MockGetAllProductUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.ProductRepository get getAllProductRepository => (super.noSuchMethod(
        Invocation.getter(#getAllProductRepository),
        returnValue: _FakeProductRepository_4(
          this,
          Invocation.getter(#getAllProductRepository),
        ),
      ) as _i5.ProductRepository);

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.ProductEntity>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue:
            _i7.Future<_i2.Either<_i8.Failure, List<_i9.ProductEntity>>>.value(
                _FakeEither_0<_i8.Failure, List<_i9.ProductEntity>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.ProductEntity>>>);
}

/// A class which mocks [GetProductUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetProductUseCase extends _i1.Mock implements _i15.GetProductUseCase {
  MockGetProductUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.ProductRepository get getProductRepository => (super.noSuchMethod(
        Invocation.getter(#getProductRepository),
        returnValue: _FakeProductRepository_4(
          this,
          Invocation.getter(#getProductRepository),
        ),
      ) as _i5.ProductRepository);

  @override
  _i7.Future<_i2.Either<_i8.Failure, _i9.ProductEntity>> execute(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue:
            _i7.Future<_i2.Either<_i8.Failure, _i9.ProductEntity>>.value(
                _FakeEither_0<_i8.Failure, _i9.ProductEntity>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, _i9.ProductEntity>>);
}

/// A class which mocks [UpdateProductUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdateProductUsecase extends _i1.Mock
    implements _i16.UpdateProductUsecase {
  MockUpdateProductUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.ProductRepository get updateProductRepository => (super.noSuchMethod(
        Invocation.getter(#updateProductRepository),
        returnValue: _FakeProductRepository_4(
          this,
          Invocation.getter(#updateProductRepository),
        ),
      ) as _i5.ProductRepository);

  @override
  _i7.Future<_i2.Either<_i8.Failure, int>> execute(
          _i9.ProductEntity? product) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [product],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, int>>.value(
            _FakeEither_0<_i8.Failure, int>(
          this,
          Invocation.method(
            #execute,
            [product],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, int>>);
}

/// A class which mocks [InsertProductUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockInsertProductUseCase extends _i1.Mock
    implements _i17.InsertProductUseCase {
  MockInsertProductUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.ProductRepository get inserProductRepository => (super.noSuchMethod(
        Invocation.getter(#inserProductRepository),
        returnValue: _FakeProductRepository_4(
          this,
          Invocation.getter(#inserProductRepository),
        ),
      ) as _i5.ProductRepository);

  @override
  _i7.Future<_i2.Either<_i8.Failure, int>> execute(
          _i9.ProductEntity? product) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [product],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, int>>.value(
            _FakeEither_0<_i8.Failure, int>(
          this,
          Invocation.method(
            #execute,
            [product],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, int>>);
}

/// A class which mocks [DeleteProductUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeleteProductUseCase extends _i1.Mock
    implements _i18.DeleteProductUseCase {
  MockDeleteProductUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.ProductRepository get deleteProductRepository => (super.noSuchMethod(
        Invocation.getter(#deleteProductRepository),
        returnValue: _FakeProductRepository_4(
          this,
          Invocation.getter(#deleteProductRepository),
        ),
      ) as _i5.ProductRepository);

  @override
  _i7.Future<_i2.Either<_i8.Failure, int>> execute(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, int>>.value(
            _FakeEither_0<_i8.Failure, int>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, int>>);
}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i19.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Either<_i8.Failure, bool>> logIn(_i20.UserEntity? user) =>
      (super.noSuchMethod(
        Invocation.method(
          #logIn,
          [user],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, bool>>.value(
            _FakeEither_0<_i8.Failure, bool>(
          this,
          Invocation.method(
            #logIn,
            [user],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, bool>>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, bool>> signUp(_i20.UserEntity? user) =>
      (super.noSuchMethod(
        Invocation.method(
          #signUp,
          [user],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, bool>>.value(
            _FakeEither_0<_i8.Failure, bool>(
          this,
          Invocation.method(
            #signUp,
            [user],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, bool>>);
}

/// A class which mocks [RemoteAuthDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoteAuthDataSource extends _i1.Mock
    implements _i21.RemoteAuthDataSource {
  MockRemoteAuthDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<bool> logIn(_i20.UserEntity? user) => (super.noSuchMethod(
        Invocation.method(
          #logIn,
          [user],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);

  @override
  _i7.Future<bool> signUp(_i20.UserEntity? user) => (super.noSuchMethod(
        Invocation.method(
          #signUp,
          [user],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i6.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i6.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<_i6.Response>.value(_FakeResponse_5(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i7.Future<_i6.Response>);

  @override
  _i7.Future<_i6.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<_i6.Response>.value(_FakeResponse_5(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i7.Future<_i6.Response>);

  @override
  _i7.Future<_i6.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i22.Encoding? encoding,
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
        returnValue: _i7.Future<_i6.Response>.value(_FakeResponse_5(
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
      ) as _i7.Future<_i6.Response>);

  @override
  _i7.Future<_i6.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i22.Encoding? encoding,
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
        returnValue: _i7.Future<_i6.Response>.value(_FakeResponse_5(
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
      ) as _i7.Future<_i6.Response>);

  @override
  _i7.Future<_i6.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i22.Encoding? encoding,
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
        returnValue: _i7.Future<_i6.Response>.value(_FakeResponse_5(
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
      ) as _i7.Future<_i6.Response>);

  @override
  _i7.Future<_i6.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i22.Encoding? encoding,
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
        returnValue: _i7.Future<_i6.Response>.value(_FakeResponse_5(
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
      ) as _i7.Future<_i6.Response>);

  @override
  _i7.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<String>.value(_i23.dummyValue<String>(
          this,
          Invocation.method(
            #read,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i7.Future<String>);

  @override
  _i7.Future<_i24.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<_i24.Uint8List>.value(_i24.Uint8List(0)),
      ) as _i7.Future<_i24.Uint8List>);

  @override
  _i7.Future<_i6.StreamedResponse> send(_i6.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i7.Future<_i6.StreamedResponse>.value(_FakeStreamedResponse_6(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i7.Future<_i6.StreamedResponse>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
