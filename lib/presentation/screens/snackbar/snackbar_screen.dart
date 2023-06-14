import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text(
            'Irure tempor enim eiusmod eiusmod voluptate id esse aute laborum nostrud enim occaecat. Non Lorem Lorem magna non do nulla in sunt proident duis velit. Amet deserunt deserunt laborum reprehenderit non.'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'Reprehenderit adipisicing est deserunt velit excepteur consectetur. Amet fugiat cupidatat excepteur elit. Fugiat ipsum cillum amet occaecat dolore quis velit consectetur. Commodo cillum fugiat culpa sit in do duis velit qui non enim et ullamco. Voluptate sint non qui amet tempor culpa elit reprehenderit laboris et voluptate est incididunt Lorem. Aliquip duis sit elit aute elit aliquip laboris non cillum. Duis proident dolore eu minim non cupidatat elit ullamco consequat sit anim labore.'),
                  ]);
                },
                child: const Text('Licencias usadas')),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                child: const Text('Mostrar Dialogo')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.remove_red_eye_outlined),
          label: const Text('Mostrar Snackbar'),
          onPressed: () => showCustomSnackBar(context)),
    );
  }
}
