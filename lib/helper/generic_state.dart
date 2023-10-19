//
// import 'package:flutter/material.dart';
//
// class GenericState extends StatefulWidget {
//   final Function()? onPress;
//   final bool showButton;
//   final String imagePath;
//   final String title;
//   final String body;
//   final String buttonText;
//   final TextStyle? titleStyle;
//   final TextStyle? bodyStyle;
//   final String? adBannerID;
//
//   /// Used to size title and body, body wil always be -4 from the given fontSize
//   final double? fontSize;
//   final double? size;
//   final double? margin;
//
//   const GenericState({
//     Key? key,
//     this.onPress,
//     this.showButton = false,
//     required this.imagePath,
//     required this.title,
//     required this.body,
//     this.titleStyle,
//     this.bodyStyle,
//     this.buttonText = "retry",
//     this.size = 88,
//     this.margin = 40,
//     this.fontSize = 18,
//     this.adBannerID,
//   }) : super(key: key);
//
//   @override
//   _GenericStateState createState() => _GenericStateState();
// }
//
// class _GenericStateState extends State<GenericState> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 16),
//       alignment: Alignment.center,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.max,
//               children: <Widget>[
//                 Image.asset(widget.imagePath, width: widget.size, height: widget.size,color: kPrimaryColor,),
//                 SizedBox(height: widget.margin),
//                 Text(widget.title,
//                     style: widget.titleStyle ??
//                         Theme.of(context).textTheme.headline3!.copyWith(fontSize: widget.fontSize,color: Theme.of(context).textTheme.headline1!.color),
//                     textAlign: TextAlign.center),
//                 const SizedBox(height: 4),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: widget.fontSize! - 4),
//                   child: Text(
//                     widget.body,
//                     style: Theme.of(context)
//                         .textTheme
//                         .caption!
//                         .copyWith(fontSize: widget.fontSize != null ? widget.fontSize! - 4 : 14,color: Theme.of(context).textTheme.headline1!.color),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           widget.showButton
//               ? Container(
//                   margin: const EdgeInsets.only(bottom: 20,left: 18,right: 18), child:
//           CustomButton2(
//             title: widget.buttonText,
//               onPressed: widget.onPress,
//               btnWidth: double.infinity,
//             btnColor: kPrimaryColor,
//             textColor: whiteColor,
//             fontSize: 16,
//             btnHeight: 48,
//             btnRadius: 6,
//           ))
//               : SizedBox.shrink(),
//         ],
//       ),
//     );
//   }
// }
