import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class AdaptiveCloseButton extends StatelessWidget {
  /// Creates a Material Design close button.
  const AdaptiveCloseButton({ super.key, this.color, this.onPressed });

  /// The color to use for the icon.
  ///
  /// Defaults to the [IconThemeData.color] specified in the ambient [IconTheme],
  /// which usually matches the ambient [Theme]'s [ThemeData.iconTheme].
  final Color? color;

  /// An override callback to perform instead of the default behavior which is
  /// to pop the [Navigator].
  ///
  /// It can, for instance, be used to pop the platform's navigation stack
  /// via [SystemNavigator] instead of Flutter's [Navigator] in add-to-app
  /// situations.
  ///
  /// Defaults to null.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    if (Platform.isIOS || Platform.isMacOS) {
      return Tooltip(
        message: MaterialLocalizations.of(context).closeButtonTooltip,
        child: CupertinoTheme(
          data: CupertinoThemeData(primaryColor: Theme.of(context).iconTheme.color),
          child: CupertinoButton(
              child: const Icon(CupertinoIcons.clear),
              onPressed: () {
                if (onPressed != null) {
                  onPressed!();
                } else {
                  Navigator.maybePop(context);
                }
              }),
        ),
      );
    }
    return IconButton(
      icon: const Icon(Icons.close),
      color: color,
      tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.maybePop(context);
        }
      },
    );
  }
}
