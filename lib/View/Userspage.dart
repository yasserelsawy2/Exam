import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/Controller/cubit/datacubit_cubit.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DatacubitCubit, DatacubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<DatacubitCubit>(context);

        if (state is datafetchedstate) {
          return Scaffold(
              body: Center(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.blue,
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  height: 4,
                ),
                itemCount: cubit.userscubit.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      '${cubit.userscubit[index].name}',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      '${cubit.userscubit[index].role}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    trailing: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.settings)),
                  );
                },
              ),
            ),
          ));
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
