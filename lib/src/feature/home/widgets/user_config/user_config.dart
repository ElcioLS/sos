import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:sos/src/data/modules/integrantes_model.dart';
import 'package:sos/src/data/modules/user_model.dart';
import 'package:sos/src/feature/home/widgets/user_config/cubit/user_cubit.dart';

class UserConfig extends StatefulWidget {
  final UserModel user;
  const UserConfig({super.key, required this.user});

  @override
  State<UserConfig> createState() => _UserConfigState();
}

class _UserConfigState extends State<UserConfig> {
  final nameEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    nameEC.text = widget.user.name;
  }

  void increment({required IntegrantesModel integrante}) {
    setState(() {
      final index = widget.user.integrantes
          .indexWhere((elemento) => elemento == integrante);
      if (index != -1) {
        widget.user.integrantes[index] =
            integrante.copyWith(quantidade: integrante.quantidade + 1);
      }
    });
  }

  void decrement({required IntegrantesModel integrante}) {
    if (integrante.quantidade > 0) {
      setState(() {
        final index = widget.user.integrantes
            .indexWhere((elemento) => elemento == integrante);
        if (index != -1) {
          widget.user.integrantes[index] =
              integrante.copyWith(quantidade: integrante.quantidade - 1);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text('Conte sobre sua família'),
            const SizedBox(height: 10),
            TextFormField(
              controller: nameEC,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            Column(
              children: widget.user.integrantes
                  .map(
                    (integrante) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(integrante.tipo),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  decrement(integrante: integrante);
                                },
                                icon: const Icon(Icons.remove)),
                            Text(integrante.quantidade.toString()),
                            IconButton(
                                onPressed: () {
                                  increment(integrante: integrante);
                                },
                                icon: const Icon(Icons.add)),
                          ],
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
            ElevatedButton(
              onPressed: () {
                context
                    .get<UserCubit>()
                    .save(widget.user.copyWith(name: nameEC.text))
                    .asyncLoader();
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
