import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';
import 'list_tile_reveal.dart';

/// A [Card] with a [ListTile] header that can be toggled via its trailing
/// widget to open and reveal more content provided via [child] in the card.
///
/// The open reveal is animated.
///
/// The ListTile and its revealed child are wrapped in a Card widget. The
/// [HeaderCard] is primarily designed to be placed on [Scaffold] using
/// its themed background color.
///
/// The header and background color of the [Card] get a slight primary color
/// blend added to its default surface color.
/// It always avoids the same color as the scaffold background, for both the
/// list tile heading and the card itself.
///
/// This is a Flutter "Universal" Widget that only depends on the SDK and
/// can be dropped into any application.
class HeaderCard extends StatefulWidget {
  const HeaderCard({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.info,
    this.trailing,
    this.margin = EdgeInsets.zero,
    this.headerPadding,
    this.headingColor,
    this.elevation = 0,
    this.enabled = true,
    this.initiallyExpanded = false,
    this.onExpansionChanged,
    this.duration = const Duration(milliseconds: 200),
    this.startStraight = false,
    this.endStraight = false,
    this.color,
    this.child, this.childPadding,
  });

  /// A widget to display before the title.
  ///
  /// Typically an [Icon] or a [CircleAvatar] widget.
  final Widget? leading;

  /// The primary content of the list tile.
  ///
  /// Typically a [Text] widget.
  ///
  /// This should not wrap. To enforce the single line limit, use
  /// [Text.maxLines].
  final Widget? title;

  /// Additional content displayed below the title.
  ///
  /// Normal you would not use the property in the HeaderCard, but it
  /// is possible if required.
  ///
  /// Typically a [Text] widget.
  final Widget? subtitle;

  /// Optional expanding info text that can be used to describe content in
  /// this header card.
  ///
  /// If null or empty string, there is no info icon and expand feature.
  final String? info;

  /// A widget to display after the title.
  ///
  /// Typically an [Icon] widget.
  ///
  /// To show right-aligned metadata (assuming left-to-right reading order;
  /// left-aligned for right-to-left reading order), consider using a [Row] with
  /// [CrossAxisAlignment.baseline] alignment whose first item is [Expanded] and
  /// whose second child is the metadata text, instead of using the [trailing]
  /// property.
  final Widget? trailing;

  /// The margins around the entire reveal list tile card.
  ///
  /// Defaults to [EdgeInsets.zero].
  final EdgeInsetsGeometry margin;

  /// The internal padding of the ListTile used as header.
  ///
  /// Insets the header [ListTile]'s contents:
  /// its [leading], [title], [subtitle].
  ///
  /// If null, `EdgeInsets.symmetric(horizontal: 16.0)` is used.
  final EdgeInsetsGeometry? headerPadding;

  /// The background color for the header.
  ///
  /// If not provided, one that is slightly off from card color
  /// background color is computed.
  final Color? headingColor;

  /// Elevation of the header card.
  ///
  /// Default to 0.
  final double elevation;

  /// Whether this list tile and card operation is interactive.
  final bool enabled;

  /// Specifies if the list tile is initially expanded (true) or collapsed (false, the default).
  final bool initiallyExpanded;

  /// Called when the tile expands or collapses.
  ///
  /// When the tile starts expanding, this function is called with the value
  /// true. When the tile starts collapsing, this function is called with
  /// the value false.
  final ValueChanged<bool>? onExpansionChanged;

  /// The duration of the show and hide animation of child.
  final Duration duration;

  /// The start side should be straight, no border radius.
  ///
  /// Defaults to false.
  final bool startStraight;

  /// The end side should be straight, no border radius.
  ///
  /// Defaults to false.
  final bool endStraight;

  /// Define this color to override that automatic adaptive background color.
  final Color? color;

  /// The child to be revealed.
  final Widget? child;

  // The padding of the child. if null then EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0) is used.
  final EdgeInsetsGeometry? childPadding;

  @override
  State<HeaderCard> createState() => _HeaderCardState();
}

class _HeaderCardState extends State<HeaderCard> {
  bool _isExpanded = false;
  void _toggleExpansion() {
    setState(() => _isExpanded = !_isExpanded);
    widget.onExpansionChanged?.call(_isExpanded);
  }

  @override
  void initState() {
    _isExpanded = widget.initiallyExpanded;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final bool useMaterial3 = theme.useMaterial3;
    final ColorScheme scheme = theme.colorScheme;
    final Color background = theme.scaffoldBackgroundColor;

    final Color cardColor = widget.color ?? theme.cardColor;
    // Compute a header color with fixed primary blend from the card color,
    // if one was not provided
    final Color headerColor = widget.headingColor ??
        Color.alphaBlend(
            scheme.surfaceTint.withAlpha(isLight ? 10 : 16), cardColor);

    final bool useHeading = widget.title != null ||
        widget.subtitle != null ||
        widget.leading != null;

    // Default starting point value based on M3 and M2 mode spec values.
    double borderRadius = useMaterial3 ? 12 : 4;
    // Is themed? Try to get the radius from the theme and used that if it was.
    final ShapeBorder? cardShape = theme.cardTheme.shape;
    if (cardShape != null && cardShape is RoundedRectangleBorder) {
      final BorderRadius shape = cardShape.borderRadius as BorderRadius;
      borderRadius = shape.bottomLeft.x;
    }
    final bool useBorderSide = colorsAreClose(cardColor, background, isLight) ||
        (useHeading && colorsAreClose(headerColor, background, isLight));
    final ShapeBorder shapeBorder = RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.horizontal(
        start:
            widget.startStraight ? Radius.zero : Radius.circular(borderRadius),
        end: widget.endStraight ? Radius.zero : Radius.circular(borderRadius),
      ),
      side: useBorderSide
          ? BorderSide(
              color: theme.dividerColor,
              width: 0.7, // This gives a hairline 1 pc border
            )
          : BorderSide.none,
    );

    return FocusTraversalGroup(
      child: Card(
        margin: widget.margin,
        shape: shapeBorder,
        elevation: widget.elevation,
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: <Widget>[
            if (useHeading)
              Material(
                type: MaterialType.card,
                color: headerColor,
                child: ListTileReveal(
                  contentPadding: widget.headerPadding,
                  subtitleDense: true,
                  leading: widget.leading,
                  title: widget.title,
                  subtitle: widget.info != null && widget.info != ''
                      ? Text(widget.info!)
                      : null,
                  trailing: widget.trailing ??
                      ((widget.enabled)
                          ? ExpandIcon(
                              size: 32,
                              isExpanded: _isExpanded,
                              padding: EdgeInsets.zero,
                              onPressed: (_) {
                                _toggleExpansion();
                              },
                            )
                          : null),
                  onTap: _toggleExpansion,
                ),
              ),
            AnimatedSwitcher(
              duration: widget.duration,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: child,
                );
              },
              child: (_isExpanded && widget.child != null)
                  ? RepaintBoundary(child: Padding(
                    padding: widget.childPadding ?? const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                    child: widget.child,
                  ))
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
