import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formz/formz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qualifighting_mobile/common/components/generic_text_form_field.dart';
import 'package:qualifighting_mobile/common/model/generic_text.dart';
import 'package:qualifighting_mobile/common/provider/theme/theme_provider.dart';
import 'package:qualifighting_mobile/login/provider/login.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    useEffect(
      () {
        emailController.addListener(
          () {
            ref
                .read(loginProvider.notifier)
                .changeEmail(value: emailController.text);
          },
        );

        passwordController.addListener(
          () {
            ref
                .read(loginProvider.notifier)
                .changePassword(value: passwordController.text);
          },
        );
        return null;
      },
      [emailController, passwordController],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        actions: [
          IconButton(
            onPressed: () =>
                ref.read(getThemeProvider.notifier).changeThemeMode(
                      ref.read(getThemeProvider) == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light,
                    ),
            icon: const Icon(Icons.dark_mode),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GenericTextFormField(
              controller: emailController,
              validator: (_) => ref
                  .watch(loginProvider.select((value) => value.email))
                  .error
                  ?.text(),
            ),
            GenericTextFormField(
              controller: passwordController,
              validator: (_) => ref
                  .watch(loginProvider.select((value) => value.email))
                  .error
                  ?.text(),
            ),
            Consumer(
              builder: (context, ref, child) {
                final status =
                    ref.watch(loginProvider.select((value) => value.status));
                return ElevatedButton(
                  onPressed: status == FormzStatus.valid
                      ? () => ref.read(loginProvider.notifier).submit()
                      : null,
                  child: const Text('Submit'),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
