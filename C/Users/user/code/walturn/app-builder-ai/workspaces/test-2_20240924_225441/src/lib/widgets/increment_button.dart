
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter_app/cubit/counter_cubit.dart';

class IncrementButton extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return InkWell(
			onTap: () => context.read<CounterCubit>().increment(),
			child: Container(
				padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
				decoration: BoxDecoration(
					color: Colors.blue,
					borderRadius: BorderRadius.circular(10.0),
				),
				child: Text(
					'Increment',
					style: TextStyle(color: Colors.white, fontSize: 16.0),
				),
			),
		);
	}
}
