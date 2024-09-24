
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:counter_app/widgets/increment_button.dart';
import 'package:counter_app/cubit/counter_cubit.dart';

class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
	group('IncrementButton Widget Tests', () {
		testWidgets('renders IncrementButton widget', (WidgetTester tester) async {
			final mockCounterCubit = MockCounterCubit();

			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BlocProvider<CounterCubit>(
							create: (_) => mockCounterCubit,
							child: IncrementButton(),
						),
					),
				),
			);

			expect(find.byType(InkWell), findsOneWidget);
			expect(find.text('Increment'), findsOneWidget);
		});

		testWidgets('calls increment on CounterCubit when tapped', (WidgetTester tester) async {
			final mockCounterCubit = MockCounterCubit();

			whenListen(mockCounterCubit, Stream<int>.fromIterable([0]), initialState: 0);

			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BlocProvider<CounterCubit>(
							create: (_) => mockCounterCubit,
							child: IncrementButton(),
						),
					),
				),
			);

			await tester.tap(find.byType(InkWell));
			await tester.pump();

			verify(() => mockCounterCubit.increment()).called(1);
		});
	});
}
