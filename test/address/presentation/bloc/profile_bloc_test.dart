import 'package:dummy_json/feature/address/data/model/pincode_model.dart';
import 'package:dummy_json/feature/address/data/profile_model/data.dart';
import 'package:dummy_json/feature/address/data/profile_model/profile_model.dart';
import 'package:dummy_json/feature/address/data/profile_model/result.dart';
import 'package:dummy_json/feature/address/presentation/bloc/profile_bloc.dart';
import 'package:dummy_json/feature/address/presentation/bloc/profile_event.dart';
import 'package:dummy_json/feature/address/presentation/bloc/profile_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';

import '../../../helper/helper_test.mocks.dart';

void main() {
  late MockProfileRepository mockProfileRepository;
  late ProfileBloc profileBloc;
  setUp(() {
    mockProfileRepository = MockProfileRepository();
    profileBloc = ProfileBloc(profileRepository: mockProfileRepository);
  });

  group('User address update event', () {
    blocTest<ProfileBloc, ProfileState>(
      'emits ProfileLoadedState when FetchProfileDataEvent is added.',
      build: () {
        final profileData = ProfileModel(data: Data(result: Result()));
        when(mockProfileRepository.fetchProfileData())
            .thenAnswer((_) async => profileData);
        return profileBloc;
      },
      act: (bloc) => bloc.add(FetchProfileDataEvent()),
      expect: () => [
        // isA<ProfileErrorState>(),
        isA<ProfileLoadedState>(),
      ],
    );

    blocTest<ProfileBloc, ProfileState>(
      'emits UserAddressUpdateState when UserAddressUpdateEvent is added.',
      build: () {
        final profileData = ProfileModel(data: Data(result: Result()));
        when(mockProfileRepository.updateUserAddressData(
                'vaibhva', 'JK apartments', '400055'))
            .thenAnswer((_) async => profileData);
        return profileBloc;
      },
      act: (bloc) => bloc.add(UserAddressUpdateEvent(
          name: 'vaibhav', address: 'JK apartments', pincode: '400055')),
      expect: () => [
        // isA<ProfileErrorState>(),
        isA<UserAddressUpdate>(),
      ],
    );

    blocTest<ProfileBloc, ProfileState>(
      'emits PincodeUpdateState when FetchPincodeEvent is added.',
      build: () {
        final pinCode = PincodeModel(postOffice: []);
        when(mockProfileRepository.fetchByPincode('400055'))
            .thenAnswer((_) async => pinCode);
        return profileBloc;
      },
      act: (bloc) => bloc.add(FetchPincodeEvent(pincode: '400055')),
      expect: () => [
        // isA<ProfileErrorState>(),
        isA<PincodeUpdateState>(),
      ],
    );
  });
}
