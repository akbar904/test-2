
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:counter_app/cubit/counter_cubit.dart';

class MockCounterCubit extends Mock implements CounterCubit {}

void main() {
	group('CounterCubit Tests', () {
		late CounterCubit counterCubit;

		setUp(() {
			counterCubit = CounterCubit();
		});

		tearDown(() {
			counterCubit.close();
		});

		test('initial state is 0', () {
			expect(counterCubit.state, 0);
		});

		blocTest<CounterCubit, int>(
			'emits [100] when increment is called',
			build: () => counterCubit,
			act: (cubit) => cubit.increment(),
			expect: () => [100],
		);

		blocTest<CounterCubit, int>(
			'emits [100, 200] when increment is called twice',
			build: () => counterCubit,
			act: (cubit) {
				cubit.increment();
				cubit.increment();
			},
			expect: () => [100, 200],
		);
	});
}
