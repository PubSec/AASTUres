import 'package:flutter/material.dart';

onDocumentLoadFailed() {
  return const Center(
    child: Text(
      'Failed to load file.',
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}
