import 'package:flutter/material.dart';
import 'package:plant_dashboard/app/data/constants.dart';

class CustomCard extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final double? borderRadius;
  final int? elevation;
  final Widget? child;
  final Border? border;
  final double? padding;
  final double? margin;
  final String? backgroundImageUrl;

  const CustomCard({
    Key? key,
    this.height,
    this.width,
    this.color,
    this.borderRadius,
    this.elevation,
    this.child,
    this.border,
    this.padding,
    this.margin,
    this.backgroundImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Constans.defaultWidth(context),
      height: height ?? Constans.defaultHeight(context),
      padding: EdgeInsets.all(padding ?? 8),
      margin: EdgeInsets.all(margin ?? 8),
      key: key,
      decoration: BoxDecoration(
        border: border,
        color: color ?? Colors.grey.shade200,
        borderRadius: BorderRadius.circular(borderRadius ?? 15),
        image: DecorationImage(
            image: NetworkImage(
              backgroundImageUrl ??
                  'https://www.pro.co.id/wp-content/uploads/2020/06/cara-mengatasi-error-404.jpg',
            ),
            fit: BoxFit.cover),
        boxShadow: [
          if (elevation == 0)
            const BoxShadow(
              color: Constans.darkColor,
              blurRadius: 0,
              offset: Offset(0.0, 0.0),
              spreadRadius: 0,
            )
          else if (elevation == 1)
            const BoxShadow(
              color: Constans.darkColor,
              blurRadius: 10,
              offset: Offset(3.0, 3.0),
              spreadRadius: 0,
            )
          else if (elevation == 2)
            const BoxShadow(
              color: Constans.darkColor,
              blurRadius: 10,
              offset: Offset(.0, 3.0),
              spreadRadius: 0,
            )
          else
            const BoxShadow(
              color: Constans.darkColor,
              blurRadius: 0,
              offset: Offset(0.0, 0.0),
              spreadRadius: 0,
            )
        ],
      ),
      child: child,
    );
  }
}
