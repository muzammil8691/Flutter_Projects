import 'package:flutter/material.dart';

class Files extends StatelessWidget {
  const Files({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Files'),
      ),
      body: Column(
        children: [
          Center(
            child: Icon(
              Icons.file_copy,
              size: 190,
            ),
          )
        ],
      ),
    );
  }
}
