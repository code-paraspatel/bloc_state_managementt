
import 'package:bloc_state_manegment/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_state_manegment/bloc/counter_bloc/counter_event_bloc.dart';
import 'package:bloc_state_manegment/bloc/counter_bloc/counter_state_bloc.dart';
import 'package:bloc_state_manegment/screen/switch_and_slider_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late CounterBloc _counterBloc;
  late CounterB _counterB;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counterBloc = CounterBloc();
    _counterB = CounterB();
  }
  @override
  void dispose() {
    super.dispose();
    _counterB.close();
    _counterBloc.close();
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => _counterBloc),
      BlocProvider(create: (_) => _counterB,)
    ],
    child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Counter Screen'),
      ),
      body:   Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc,CounterState>(
            builder: (context, counterState) {
              return  Center(child: Text('Counter +1: '+counterState.counter.toString(),style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),));
            },),
          const SizedBox(height: 20,),
          BlocBuilder<CounterB,CounterS>(
            builder: (context, counterS) {
              return  Center(child: Text('Counter +2: '+counterS.y.toString(),style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),));
            },),
          const SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<CounterBloc,CounterState>(
                buildWhen: (previous, current) => false,
                builder: (context, state) {
                return MaterialButton(
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none
                  ),
                  color: Colors.blue,
                  height: 50,
                  minWidth: 70,
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementCounter());
                    context.read<CounterB>().add(IncrementC());
                  },child: const Text('Increment'),);
              },),
              BlocBuilder<CounterBloc,CounterState>(
                buildWhen: (previous, current) => false,
                builder: (context, state) {
                  return  MaterialButton(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                    ),
                    color: Colors.red.withOpacity(0.3),
                    height: 50,
                    minWidth: 70,
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context,listen: false).add(DecrementCounter());
                      context.read<CounterB>().add(DecrementC());
                    },child: const Text('Decrement'),);
                },),
              BlocBuilder<CounterBloc,CounterState>(
                buildWhen: (previous, current) => false,
                builder: (context, state) {
                  return  MaterialButton(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                    ),
                    color: Colors.red.withOpacity(0.3),
                    height: 50,
                    minWidth: 70,
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context,listen: false).add(ResetCounter());
                    },child: const Text('Reset'),);
                },),

            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SwitchSliderScreen(),));
          }, child: const Text('Next Switch screen'))

        ],
      ),
    ),);
  }
}
