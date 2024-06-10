import 'package:bloc_state_manegment/bloc/get_api_bloc/get_api_bloc.dart';
import 'package:bloc_state_manegment/bloc/get_api_bloc/get_api_event.dart';
import 'package:bloc_state_manegment/bloc/get_api_bloc/get_api_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetApiScreen extends StatefulWidget {
  const GetApiScreen({super.key});

  @override
  State<GetApiScreen> createState() => _GetApiScreenState();
}

class _GetApiScreenState extends State<GetApiScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetApiBloc>().add(GetApiList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Data'),
      ),
      body: BlocBuilder<GetApiBloc, GetApiState>(
        builder: (context, state) {
          if (state.getApiStatus == GetApiStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.getApiStatus == GetApiStatus.success) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Enter Email', border: OutlineInputBorder()),
                    onChanged: (value) {
                      context.read<GetApiBloc>().add(SearchList(value));
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: state.stMessage.isNotEmpty
                        ? Center(child: Text(state.stMessage.toString()))
                        : ListView.builder(
                            itemCount: state.tempApiList.isEmpty
                                ? state.getApiModalList.length
                                : state.tempApiList.length,
                            itemBuilder: (context, index) {
                              if (state.tempApiList.isNotEmpty) {
                                final item = state.tempApiList[index];
                                return Card(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(item.id.toString()),
                                      Text(item.email.toString()),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(item.body.toString()),
                                    ],
                                  ),
                                );
                              } else {
                                final item = state.getApiModalList[index];
                                return Card(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(item.id.toString()),
                                      Text(item.email.toString()),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(item.body.toString()),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text(state.massage.toString()),
            );
          }
        },
      ),
    );
  }
}
