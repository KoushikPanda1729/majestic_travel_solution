// import 'package:flutter/material.dart';

// class FeaturedCard extends StatelessWidget {
//   final Widget child;
//   final double width;
//   final Color backgroundColor;
//   final double borderRadius;

//   const FeaturedCard({
//     super.key,
//     required this.child,
//     this.width = double.infinity,
//     this.backgroundColor = Colors.white,
//     this.borderRadius = 12,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(borderRadius),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 4,
//             spreadRadius: 1,
//           ),
//         ],
//       ),
//       child: child,
//     );
//   }
// }

import 'package:flutter/material.dart';

class FeaturedCard extends StatelessWidget {
  final Widget child;
  final double width;
  final double? height; // Added height parameter
  final Color backgroundColor;
  final double borderRadius;

  const FeaturedCard({
    super.key,
    required this.child,
    this.width = double.infinity,
    this.height, // Making it optional
    this.backgroundColor = Colors.white,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height, // Applying height
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}
