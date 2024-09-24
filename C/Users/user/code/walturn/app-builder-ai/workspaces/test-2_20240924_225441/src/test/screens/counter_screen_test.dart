
import 'package:flutter_test/flutter_test.dart';
import 'package:counter_app/screens/counter_screen.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:counter_app/cubit/counter_cubit.dart';

// Mock Cubit
class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
	group('CounterScreen', () {
		late MockCounterCubit mockCounterCubit;

		setUp(() {
			mockCounterCubit = MockCounterCubit();
		});

		testWidgets('should display initial counter value', (WidgetTester tester) async {
			when(() => mockCounterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				BlocProvider<CounterCubit>.value(
					value: mockCounterCubit,
					child: MaterialApp(
						home: CounterScreen(),
					),
				),
			);

			expect(find.text('0'), findsOneWidget);
			expect(find.byType(ElevatedButton), findsOneWidget);
		});

		testWidgets('should display updated counter value when state changes', (WidgetTester tester) async {
			whenListen(
				mockCounterCubit,
				Stream<int>.fromIterable([0, 100]),
				initialState: 0,
			);

			await tester.pumpWidget(
				BlocProvider<CounterCubit>.value(
					value: mockCounterCubit,
					child: MaterialApp(
						home: CounterScreen(),
					),
				),
			);

			// Initial state
			expect(find.text('0'), findsOneWidget);
			expect(find.byType(ElevatedButton), findsOneWidget);

			// Wait for the stream to emit updated value
			await tester.pump();

			// Updated state
			expect(find.text('100'), findsOneWidget);
		});

		testWidgets('should call increment when button is tapped', (WidgetTester tester) async {
			when(() => mockCounterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				BlocProvider<CounterCubit>.value(
					value: mockCounterCubit,
					child: MaterialApp(
						home: CounterScreen(),
					),
				),
			);

			await tester.tap(find.byType(ElevatedButton));
			verify(() => mockCounterCubit.increment()).called(1);
		});
	});
}
