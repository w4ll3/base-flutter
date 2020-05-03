import 'package:baseproject/ui/app_style.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DefaultShimmer extends StatelessWidget {
  const DefaultShimmer({
    this.child,
    Key key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppStyle.shimmerBaseColor,
      highlightColor: AppStyle.shimmerHighlightColor,
      child: child,
    );
  }
}
