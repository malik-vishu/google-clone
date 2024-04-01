import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_clone/cubit/key_cubit.dart';
import 'package:google_clone/responsive/mobile_layout.dart';
import 'package:google_clone/responsive/responsive_layout_widget.dart';
import 'package:google_clone/responsive/web_layout.dart';

class ApiKeyScreen extends StatefulWidget {
  const ApiKeyScreen({super.key});

  @override
  State<ApiKeyScreen> createState() => _ApiKeyScreenState();
}

class _ApiKeyScreenState extends State<ApiKeyScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final keyCubit = BlocProvider.of<KeyCubit>(context);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 250,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: controller,
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.key),
                    labelText: 'Key',
                    hintText: 'Enter your API key',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your API key.';
                    } else if (value.length < 2) {
                      return 'API key seems too short. It should be at least 32 characters.';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        log('Processing API request...');
                        try {
                          log(controller.text);
                          keyCubit.update(controller.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('API key stored!')),
                          );
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ResponsiveWidget(
                                mobileScreenLayout: MobileScreenLayout(),
                                webScreenLayout: WebScreenLayout()),
                          ));
                        } catch (error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error: $error')),
                          );
                        }
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
