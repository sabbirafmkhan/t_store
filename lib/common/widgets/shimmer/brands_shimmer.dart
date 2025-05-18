import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/shimmer/shimmer.dart';

class TBrandsShimmer extends StatelessWidget {
  const TBrandsShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (_, __) => TShimmerEffect(width: 300, height: 80),
    );
  }
}
