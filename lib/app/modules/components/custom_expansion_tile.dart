import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.onExpansionChanged,
    this.children = const <Widget>[],
    this.trailing,
    this.initiallyExpanded = false,
    this.maintainState = true,
    this.tilePadding,
    this.expandedCrossAxisAlignment,
    this.expandedAlignment,
    this.childrenPadding,
    this.backgroundColor,
    this.collapsedBackgroundColor,
    this.textColor,
    this.collapsedTextColor,
    this.iconColor,
    this.collapsedIconColor,
    this.shape,
    this.collapsedShape,
    this.clipBehavior,
    this.controlAffinity,
    this.required = false,
    this.label,
  }) : assert(
          expandedCrossAxisAlignment != CrossAxisAlignment.baseline,
          'CrossAxisAlignment.baseline is not supported since the expanded children '
          'are aligned in a column, not a row. Try to use another constant.',
        );
  final Widget? leading;
  final Widget? title;
  final String? label;
  final Widget? subtitle;
  final ValueChanged<bool>? onExpansionChanged;
  final List<Widget> children;
  final Color? backgroundColor;
  final Color? collapsedBackgroundColor;

  final Widget? trailing;
  final bool initiallyExpanded;
  final bool maintainState;

  final EdgeInsetsGeometry? tilePadding;

  final Alignment? expandedAlignment;

  final CrossAxisAlignment? expandedCrossAxisAlignment;

  final EdgeInsetsGeometry? childrenPadding;

  final Color? iconColor;
  final bool required;

  final Color? collapsedIconColor;

  final Color? textColor;

  final Color? collapsedTextColor;

  final ShapeBorder? shape;

  final ShapeBorder? collapsedShape;

  final Clip? clipBehavior;

  final ListTileControlAffinity? controlAffinity;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        child: ExpansionTile(
          title: required
              ? Row(
                  children: [
                    if (label != null) Text(label!, style: Theme.of(context).textTheme.bodyLarge),
                    if (title != null) title!,
                    Text('*', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.redAccent)),
                  ],
                )
              : label != null
                  ? Text(label!, style: Theme.of(context).textTheme.bodyLarge)
                  : title!,
          onExpansionChanged: onExpansionChanged,
          trailing: trailing,
          initiallyExpanded: initiallyExpanded,
          tilePadding: tilePadding,
          expandedAlignment: expandedAlignment,
          expandedCrossAxisAlignment: expandedCrossAxisAlignment,
          maintainState: maintainState,
          leading: leading,
          controlAffinity: controlAffinity,
          iconColor: iconColor,
          textColor: textColor,
          shape: shape,
          subtitle: subtitle,
          childrenPadding: childrenPadding ?? const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          clipBehavior: clipBehavior,
          collapsedBackgroundColor: collapsedBackgroundColor,
          collapsedIconColor: collapsedIconColor,
          collapsedShape: collapsedShape,
          collapsedTextColor: collapsedTextColor,
          backgroundColor: backgroundColor,
          children: children,
        ),
      ),
    );
  }
}
