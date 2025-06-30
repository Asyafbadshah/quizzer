import 'package:flutter/material.dart';


class HistoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCardClipper(),
      child: Container(
        width: 100,
        height: 220,
        color: Colors.redAccent,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.menu_book, color: Colors.white, size: 28),
            const Spacer(),
            Text(
              'History',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                CircleAvatar(
                  radius: 14,
                  backgroundImage: NetworkImage(
                    'https://example.com/teacher_photo.jpg', // Replace with actual image
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Abby Adams',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(size.width - 30, 0);
    // path.quadraticBezierTo(size.width, 50, size.width, 100);
    // path.lineTo(size.width, size.height - 30);
    // path.quadraticBezierTo(size.width , size.height, size.width - 40, size.height);
    // path.lineTo(0, size.height);
    // Deep middle curve inward
    path.quadraticBezierTo(
        size.width * 0.65, size.height * 0.5, size.width, size.height * 0.8);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
