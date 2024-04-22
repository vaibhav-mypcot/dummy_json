import 'package:bloc_test/bloc_test.dart';
import 'package:dummy_json/feature/address/data/profile_model/result.dart';
import 'package:dummy_json/feature/address/presentation/bloc/profile_bloc.dart';
import 'package:dummy_json/feature/address/presentation/bloc/profile_event.dart';
import 'package:dummy_json/feature/address/presentation/bloc/profile_state.dart';
import 'package:dummy_json/feature/address/presentation/page/address_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProfileBloc extends MockBloc<ProfileEvent, ProfileState>
    implements ProfileBloc {}

void main() {
  late MockProfileBloc mockProfileBloc;

  setUp(() {
    mockProfileBloc = MockProfileBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<ProfileBloc>(
      create: (context) => mockProfileBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('renders loading state', (tester) async {
    when(() => mockProfileBloc.state).thenReturn(ProfileLoadingState());
    await tester.pumpWidget(makeTestableWidget(const AddressScreen()));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('renders loaded state', (WidgetTester tester) async {
    when(() => mockProfileBloc.state).thenReturn(ProfileLoadedState(Result()));

    await tester.pumpWidget(makeTestableWidget(const AddressScreen()));
    var textFind = find.text("Your Address");

    expect(textFind, findsAny);
  });

  testWidgets('navigates to edit screen on edit icon tap',
      (WidgetTester tester) async {
    when(() => mockProfileBloc.state).thenReturn(ProfileLoadedState(Result()));

    await tester.pumpWidget(makeTestableWidget(const AddressScreen()));

    await tester.tap(find.byIcon(Icons.edit_note_sharp));
    // Verify navigation here
  });

  testWidgets('renders error state', (WidgetTester tester) async {
    when(() => mockProfileBloc.state).thenReturn(ProfileErrorState('Error fetching data'));

    await tester.pumpWidget(
      makeTestableWidget(const AddressScreen())
    );

    expect(find.text('Got error: ProfileErrorState'), findsOneWidget);
    // Add more expect statements to verify error handling if needed
  });
}
