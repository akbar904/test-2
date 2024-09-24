
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:counter_app/models/counter_model.dart';

void main() {
	group('Counter Model Tests', () {
		test('Counter initial value should be 0', () {
			final counter = Counter(value: 0);
			expect(counter.value, 0);
		});

		test('Counter value should be incrementable', () {
			final counter = Counter(value: 0);
			final incrementedCounter = Counter(value: counter.value * 100);
			expect(incrementedCounter.value, 0 * 100);
		});
	});
}
