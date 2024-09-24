
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter_app/widgets/counter_display.dart';

void main() {
	group('CounterDisplay Widget', () {
		testWidgets('displays the initial counter value', (WidgetTester tester) async {
			// Create a simple BlocProvider with initial value 0 for the test
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>(
						create: (context) => CounterCubit(),
						child: const CounterDisplay(),
					),
				),
			);

			// Verify that the CounterDisplay shows '0'
			expect(find.text('0'), findsOneWidget);
		});

		testWidgets('displays the updated counter value', (WidgetTester tester) async {
			// Create a BlocProvider with initial value 0 for the test
			final cubit = CounterCubit();

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>(
						create: (context) => cubit,
						child: const CounterDisplay(),
					),
				),
			);

			// Increment the counter by 100 and pump the widget to reflect changes
			cubit.increment();
			await tester.pump();

			// Verify that the CounterDisplay shows '100'
			expect(find.text('100'), findsOneWidget);
		});
	});
}

class CounterCubit extends Cubit<int> {
	CounterCubit() : super(0);

	void increment() {
		emit(state + 100);
	}
}
