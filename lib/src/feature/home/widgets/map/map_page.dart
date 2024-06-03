import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:sos/src/feature/home/widgets/map/widgets/list_users.dart';

import 'cubit/map_cubit.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MapCubit, MapState>(
        bloc: context.get<MapCubit>(),
        builder: (context, state) {
          if (state is MapInitial) {
            return Container();
          } else if (state is MapLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MapLoaded) {
            return ListUsers(users: state.users);
          } else if (state is MapEmpty) {
            return const Center(
              child: Text('Niguém precisando de resgate'),
            );
          }

          return Container();
        },
      ),
    );
  }
}
