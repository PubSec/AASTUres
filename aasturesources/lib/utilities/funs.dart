import 'package:flutter/material.dart';

onDocumentLoadFailed() {
  return const Center(
    child: Text('Failed to load file.'),
  );
}

onDocumentLoaded(BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text(
        'Document loaded successfully',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.green,
    ),
  );
}
