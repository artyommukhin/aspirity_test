import 'package:flutter/material.dart';

class ErrorText extends Text {
  const ErrorText(super.data, {super.key})
      : super(style: const TextStyle(color: Colors.redAccent));
}
