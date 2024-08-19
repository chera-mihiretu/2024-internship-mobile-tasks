import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../test_helper/auth_test_data/testing_data.dart';
import '../../../../test_helper/test_helper_generation.mocks.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late AuthBloc authBloc;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    authBloc = AuthBloc(repository: mockAuthRepository);
  });

  test('Bloc should in its iinitial point ', () {
    expect(authBloc.state, isA<AuthInitial>());
  });

  blocTest('log in test',
      build: () {
        when(mockAuthRepository.logIn(any))
            .thenAnswer((_) async => const Right(true));
        return authBloc;
      },
      act: (bloc) => bloc.add(
            LogInEvent(
              email: AuthData.email,
              password: AuthData.password,
            ),
          ),
      expect: () => [
            AuthLoadingstate(),
            LogInSuccessState(),
          ]);
}
