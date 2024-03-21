import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/core/provider/providers.dart';

class FormPage extends ConsumerStatefulWidget {
  const FormPage({super.key});

  static const route = "/form";

  @override
  ConsumerState<FormPage> createState() => _FormPageState();
}

class _FormPageState extends ConsumerState<FormPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final playerXNameController = TextEditingController();
    // ignore: unused_local_variable
    final playerONameController = TextEditingController();

    @override
    // ignore: unused_element
    void dispose() {
      playerONameController.dispose();
      playerXNameController.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: TextField(
                controller: playerXNameController,
                onChanged: (value) => ref
                    .read(playerXNameProvider.notifier)
                    .update((state) => value),
                decoration: InputDecoration(
                  labelText: 'Player X Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Enter a name for Player X',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: TextField(
                controller: playerONameController,
                onChanged: (value) => ref
                    .read(playerONameProvider.notifier)
                    .update((state) => value),
                decoration: InputDecoration(
                  labelText: 'Player O Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Enter a name for Player O',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: FilledButton(
                  onPressed: () {
                    context.go('/game');
                  },
                  child: const Text('Start Match')),
            ),
          ],
        ),
      ),
    );
  }
}
