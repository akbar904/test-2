
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter_app/main.dart';

class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
	group('Main', () {
		testWidgets('should render MyApp', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			expect(find.byType(MyApp), findsOneWidget);
		});

		testWidgets('should display CounterScreen', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());
			await tester.pumpAndSettle();

			expect(find.byType(CounterScreen), findsOneWidget);
		});
	});
}
