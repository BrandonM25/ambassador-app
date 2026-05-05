import 'package:flutter/material.dart';

class CrestLogo extends StatelessWidget {
  const CrestLogo({super.key, this.size = 120, this.color});

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tone = color ?? cs.onSurface.withValues(alpha: .9);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _CrestPainter(tone),
      ),
    );
  }
}

class _CrestPainter extends CustomPainter {
  _CrestPainter(this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * .05
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final shield = Path()
      ..moveTo(size.width * .22, size.height * .18)
      ..quadraticBezierTo(size.width * .5, size.height * .03, size.width * .78, size.height * .18)
      ..lineTo(size.width * .72, size.height * .62)
      ..quadraticBezierTo(size.width * .5, size.height * .9, size.width * .28, size.height * .62)
      ..close();
    canvas.drawPath(shield, p);

    final aPath = Path()
      ..moveTo(size.width * .39, size.height * .62)
      ..lineTo(size.width * .5, size.height * .3)
      ..lineTo(size.width * .61, size.height * .62)
      ..moveTo(size.width * .43, size.height * .5)
      ..lineTo(size.width * .57, size.height * .5);
    canvas.drawPath(aPath, p);

    canvas.drawLine(Offset(size.width * .5, size.height * .26), Offset(size.width * .5, size.height * .4), p);
    canvas.drawLine(Offset(size.width * .44, size.height * .33), Offset(size.width * .56, size.height * .33), p);

    final laurel = Paint()
      ..color = color.withValues(alpha: .65)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * .028;
    canvas.drawArc(Rect.fromLTWH(size.width * .18, size.height * .36, size.width * .2, size.height * .34), 1.25, 1.5, false, laurel);
    canvas.drawArc(Rect.fromLTWH(size.width * .62, size.height * .36, size.width * .2, size.height * .34), 0.4, 1.5, false, laurel);

    final crown = Path()
      ..moveTo(size.width * .34, size.height * .16)
      ..lineTo(size.width * .4, size.height * .09)
      ..lineTo(size.width * .5, size.height * .15)
      ..lineTo(size.width * .6, size.height * .09)
      ..lineTo(size.width * .66, size.height * .16);
    canvas.drawPath(crown, p);
  }

  @override
  bool shouldRepaint(covariant _CrestPainter oldDelegate) => oldDelegate.color != color;
}
