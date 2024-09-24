
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter_app/cubit/counter_cubit.dart';

class CounterDisplay extends StatelessWidget {
	const CounterDisplay({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return BlocBuilder<CounterCubit, int>(
			builder: (context, count) {
				return Center(
					child: Text(
						'$count',
						style: Theme.of(context).textTheme.headline4,
					),
				);
			},
		);
	}
}
