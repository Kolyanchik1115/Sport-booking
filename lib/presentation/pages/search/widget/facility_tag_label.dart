import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sport_app/data/models/facility/facility_data.dart';

class FacilityTagLabel extends StatelessWidget {
  final FacilityData? facility;
  final String labelType;

  const FacilityTagLabel({
    super.key,
    required this.labelType,
    required this.facility,
  });

  List<String> getLabels() {
    switch (labelType) {
      case 'sportType':
        return facility?.sportType ?? [];
      case 'facilityType':
        return [facility?.facilityType ?? ''];
      case 'coveringType':
        return [facility?.coveringType ?? ''];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> labels = getLabels();
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Wrap(
        spacing: 5.0,
        runSpacing: 20.0,
        children: labels.map((label) {
          return Chip(
            avatar: SvgPicture.asset(
              'assets/svg/icons/$label.svg',
              height: 15.0,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: Text(
              label,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.25),
            shape: const StadiumBorder(
              side: BorderSide(color: Colors.white),
            ),
          );
        }).toList(),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:sport_app/data/models/facility/facility_data.dart';
//
// class FacilityTagLabel extends StatelessWidget {
//   final FacilityData? facility;
//   final String labelType;
//
//   const FacilityTagLabel({
//     super.key,
//     required this.labelType,
//     required this.facility,
//   });
//
//   List<String> getLabels() {
//     switch (labelType) {
//       case 'sportType':
//         return facility?.sportType ?? [];
//       case 'facilityType':
//         return [facility?.facilityType ?? ''];
//       case 'coveringType':
//         return [facility?.coveringType ?? ''];
//       default:
//         return [];
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<String> labels = getLabels();
//
//     // Define the linear gradient with the specified colors
//     final gradient = LinearGradient(
//       colors: [
//         Color(0xFFFF9398).withOpacity(0.6),
//         Color(0xFFFF8749),
//       ],
//       begin: Alignment.centerLeft,
//       end: Alignment.centerRight,
//     );
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//       child: Wrap(
//         spacing: 10.0, // Горизонтальный отступ между фильтрами
//         runSpacing: 10.0, // Вертикальный отступ между фильтрами
//         children: labels.map((label) {
//           return Container(
//             decoration: BoxDecoration(
//               gradient: gradient, // Apply the gradient background
//               borderRadius: BorderRadius.circular(20), // Adjust border radius for rounded corners
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0), // Add padding for a better look
//               child: Row( // Using Row to hold the avatar and text
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   SvgPicture.asset(
//                     'assets/svg/icons/$label.svg',
//                     height: 15.0,
//                     color: Colors.white, // Icon color, considering the background
//                   ),
//                   SizedBox(width: 8), // Space between icon and text
//                   Text(
//                     label,
//                     style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                       color: Colors.white, // White text to contrast with the gradient
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
