import 'package:flutter/material.dart';

/// Displays a modal sheet that slides in from the top.
///
/// This function is a convenient way to display a modal sheet that appears from the top of the screen.
/// It utilizes the [showGeneralDialog] method and [SlideTransition] for the slide-in animation.
///
/// The [child] parameter specifies the content of the modal sheet.
///
/// The [barrierDismissible] parameter controls whether the modal sheet can be dismissed by tapping outside of it.
///
/// The [borderRadius] parameter allows customization of the border radius of the modal sheet.
/// If no [borderRadius] is specified, the default value of `null` will be used, resulting in no border radius.
///
/// The [transitionDuration] parameter allows customization of the duration of the slide-in animation.
///
/// The [backgroundColor] parameter allows customization of the background color of the modal sheet.
///
/// The [barrierColor] parameter allows customization of the color of the barrier that prevents interaction with the rest of the screen.
///
/// The [startOffset] parameter allows customization of the starting position of the modal sheet.
///
/// The [curve] parameter allows customization of the curve of the slide-in animation.

Future<T?> showTopModalSheet<T>(
  BuildContext context,
  Widget child, {
  bool barrierDismissible = true,
  BorderRadiusGeometry? borderRadius,
  Duration transitionDuration = const Duration(milliseconds: 250),
  Color? backgroundColor,
  Color barrierColor = const Color(0x80000000),
  Offset startOffset = const Offset(0, -1.0),
  Curve curve = Curves.easeOutCubic,
}) {
  return showGeneralDialog<T?>(
    context: context,
    barrierDismissible: barrierDismissible,
    transitionDuration: transitionDuration,
    barrierLabel: MaterialLocalizations.of(context).dialogLabel,
    barrierColor: barrierColor,
    pageBuilder: (context, _, __) => child,
    transitionBuilder: (context, animation, _, child) {
      return SlideTransition(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              type: backgroundColor == null
                  ? MaterialType.transparency
                  : MaterialType.canvas,
              color: backgroundColor,
              borderRadius: borderRadius,
              clipBehavior: Clip.antiAlias,
              child: child,
            )
          ],
        ),
        position: CurvedAnimation(parent: animation, curve: curve)
            .drive(Tween<Offset>(begin: startOffset, end: Offset.zero)),
      );
    },
  );
}
