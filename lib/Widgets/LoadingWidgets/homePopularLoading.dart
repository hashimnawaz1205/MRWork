import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomePopularLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black12,
      highlightColor: Colors.white,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          loadingTile(),
          loadingTile(),
          loadingTile(),
          loadingTile(),
          loadingTile(),
          loadingTile(),
        ],
      ),
    );
  }
}

loadingTile() {
  return Container(
    margin: const EdgeInsets.only(right: 6.0, left: 4.0),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
        color: Colors.grey[10],
        boxShadow: [
          BoxShadow(
              color: Color(0xffd4d4d9), spreadRadius: 0.5, blurRadius: 2.0),
        ],
        border: Border.all(color: Colors.black12)),
    child: Container(
      padding: const EdgeInsets.only(top: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 18.0, right: 18.0),
            child: SizedBox(
              width: 100,
            ),
          ),
        ],
      ),
    ),
  );
}
