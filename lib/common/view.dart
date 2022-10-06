import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// class CAppBar extends AppBar {
//   final String headerTitle;
//
//   CAppBar(this.headerTitle, {Key? key})
//       : super(
//           key: key,
//           elevation: 0.0,
//           title: Text(
//             headerTitle,
//             style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.normal,
//                 color: Colors.white),
//           ),
//           automaticallyImplyLeading: true,
//           centerTitle: true,
//         );
// }
//
// class CButton extends StatelessWidget {
//   final String title;
//   final VoidCallback? onPressed;
//
//   CButton({required this.title, required this.onPressed});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: CupertinoButton(
//           color: MyColor.PRIMARY_COLOR,
//           borderRadius: const BorderRadius.all(Radius.circular(8)),
//           padding:
//               const EdgeInsets.only(top: 8, left: 32, right: 32, bottom: 8),
//           pressedOpacity: 0.5,
//           onPressed: () {
//             onPressed?.call();
//             FocusScope.of(context).unfocus();
//           },
//           child: Text(title)),
//     );
//   }
// }
//
// class CText extends StatelessWidget {
//   final String title;
//   final double? size;
//   final Color? color;
//   final FontWeight? fontWeight;
//
//   final VoidCallback? onPressed;
//
//   const CText(this.title,
//       {Key? key, this.size, this.color, this.fontWeight, this.onPressed})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     if (onPressed != null) {
//       return GestureDetector(
//         onTap: () {
//           onPressed?.call();
//         },
//         child: Text(
//           title,
//           style: TextStyle(
//               fontSize: size ?? FontSize.s14,
//               color: color ?? MyColor.PRIMARY_COLOR,
//               fontWeight: fontWeight),
//         ),
//       );
//     }
//     return Text(
//       title,
//       style: TextStyle(
//           fontSize: size ?? FontSize.s14,
//           color: color ?? MyColor.PRIMARY_COLOR,
//           fontWeight: fontWeight),
//     );
//   }
// }
//
// class CTextField extends StatelessWidget {
//   final String? placeholder;
//   final bool? obscureText;
//   final ValueChanged<String>? onChanged;
//   final IconData? icon;
//   final TextInputType? keyboardType;
//
//   const CTextField({
//     Key? key,
//     this.placeholder,
//     this.obscureText,
//     this.onChanged,
//     this.icon,
//     this.keyboardType,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       onChanged: onChanged,
//       obscureText: obscureText ?? false,
//       keyboardType: keyboardType,
//       decoration: InputDecoration(
//           labelText: placeholder, icon: icon != null ? Icon(icon) : null),
//     );
//   }
// }
//
// class FontSize {
//   static const s16 = 16.0;
//   static const s14 = 14.0;
//   static const s12 = 12.0;
// }
//
// const SizeBoxHeight = SizedBox(
//   height: 16,
// );
//
// const SizeBoxWidth = SizedBox(
//   width: 16,
// );
