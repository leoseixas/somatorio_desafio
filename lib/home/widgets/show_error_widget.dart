import 'package:flutter/material.dart';

class ShowErrorWidget extends StatelessWidget {
  final bool showError;

  const ShowErrorWidget({Key? key, this.showError = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return showError
        ? Container(
            width: double.infinity,
            height: 56,
            margin: const EdgeInsets.only(top: 25),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.red[300],
            ),
            child: const Text(
              'Digite um numero para calcular',
              style: TextStyle(color: Colors.white),
            ),
          )
        : const SizedBox();
  }
}
