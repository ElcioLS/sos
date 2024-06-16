import 'package:flutter/material.dart';
import 'package:sos/src/feature/home/widgets/map/widgets/detail_user.dart';

import '../../../../../data/modules/user_model.dart';

class ListUsers extends StatelessWidget {
  final List<UserModel> users;

  const ListUsers({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Pessoas próximas'),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => DetailUser(user: user),
                    barrierDismissible: true,
                  );
                },
                leading: CircleAvatar(
                  child: Text(user.name[0]),
                ),
                title: Text(user.name),
                // trailing: Text('${user.distance.toStringAsFixed(2)} m'),
                trailing:
                    Text('${(user.distance / 1000).toStringAsFixed(2)} km'),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: users.length,
          ),
        ),
      ],
    );
  }
}
