
import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
	CounterCubit() : super(0);

	void increment() => emit(state == 0 ? 100 : state + 100);
}
