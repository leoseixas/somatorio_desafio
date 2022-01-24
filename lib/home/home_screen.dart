import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:somatorio/home/home_controller.dart';
import 'package:somatorio/home/widgets/show_error_widget.dart';
import 'package:somatorio/home/widgets/show_result_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Desafio Somatorio"),
      ),
      body: Consumer<HomeController>(
        builder: (context, value, child) {
          return Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                TextFormField(
                  controller: value.textController,
                  decoration: const InputDecoration(
                    labelText: "Digite um número",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue[300]),
                    ),
                    onPressed: () async {
                      await value.summationAllvalues();
                    },
                    child: const Text(
                      'Calcular',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                ShowResultWidget(
                  showResult: value.showResult,
                  result: value.result.toString(),
                ),
                ShowErrorWidget(showError: value.showError),
              ],
            ),
          );
        },
      ),
    );
  }
}
