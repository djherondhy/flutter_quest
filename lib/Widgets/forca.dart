import 'package:flutter/material.dart';

class Forca extends StatelessWidget {
  final int forcaValue;
  const Forca({
    required this.forcaValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(Icons.star,
              color: (forcaValue >= 1) ? Colors.deepPurple : Colors.black12),
          Icon(Icons.star,
              color: (forcaValue >= 2) ? Colors.deepPurple : Colors.black12),
          Icon(Icons.star,
              color: (forcaValue >= 3) ? Colors.deepPurple : Colors.black12),
          Icon(Icons.star,
              color: (forcaValue >= 4) ? Colors.deepPurple : Colors.black12),
          Icon(Icons.star,
              color: (forcaValue >= 5) ? Colors.deepPurple : Colors.black12),
        ],
      ),
    );
  }
}
