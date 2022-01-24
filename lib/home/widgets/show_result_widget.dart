import 'package:flutter/material.dart';

class ShowResultWidget extends StatelessWidget {
  final bool showResult;
  final String? result;

  const ShowResultWidget({Key? key, this.showResult = false, this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: showResult
          ? Container(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                "O valor resultado é $result",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
