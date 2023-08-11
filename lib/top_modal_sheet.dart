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

Future<T?> showTopModalSheet<T>(
  BuildContext context,
  Widget child, {
  bool barrierDismissible = true,
  BorderRadiusGeometry? borderRadius,
}) {
  return showGeneralDialog<T?>(
    context: context,
    barrierDismissible: barrierDismissible,
    transitionDuration: const Duration(milliseconds: 250),
    barrierLabel: MaterialLocalizations.of(context).dialogLabel,
    barrierColor: Colors.black.withOpacity(0.5),
    pageBuilder: (context, _, __) => child,
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        child: Column(
          children: [
            Material(
              borderRadius: borderRadius,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [child],
              ),
            )
          ],
        ),
        position: CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)
            .drive(
                Tween<Offset>(begin: const Offset(0, -1.0), end: Offset.zero)),
      );
    },
  );
}
