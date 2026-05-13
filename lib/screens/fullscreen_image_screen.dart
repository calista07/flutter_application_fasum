import 'dart:convert';
import 'package:flutter/material.dart';

class FullScreenImageScreen extends StatefulWidget {
  final String imageBase64;
  const FullScreenImageScreen({super.key, required this.imageBase64});

  @override
  State<FullScreenImageScreen> createState() => _FullScreenImageScreenState();
}

class _FullScreenImageScreenState extends State<FullScreenImageScreen> {
  @override
  Widget build(BuildContext context) {
    final bytes = base64Decode(widget.imageBase64);

    return Scaffold(
      backgroundColor: Colors.black, // Optional: for better full-screen feel
      body: GestureDetector(
        onTap: () => Navigator.pop(context), // Tap to go back to homescreen
        child: InteractiveViewer(
          minScale: 1.0,
          maxScale: 4.0, // Allow zooming up to 4x
          child: Center(
            child: Image.memory(
              bytes,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}