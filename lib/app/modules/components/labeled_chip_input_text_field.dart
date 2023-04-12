import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LabeledChipTextField extends StatefulWidget {
  /// list of Strings to prepopulate the chips with
  final List<String> initialValue;

  /// returns a list of string on inout field submitted
  final ValueChanged<List<String>> onChanged;

  /// number of maximum chips
  final int? maxChips;

  /// enables the input field and chip delete ability
  final bool enabled;

  /// inout field action
  final TextInputAction inputAction;

  /// keyboard appearance
  final Brightness? keyboardAppearance;

  /// autofocus the inout field
  final bool autofocus;

  /// text capitalization type for the input field keyboard
  final TextCapitalization textCapitalization;

  /// text input decoration
  final InputDecoration inputDecoration;

  /// text overflow behaviour
  final TextOverflow textOverflow;

  /// keyboard input type
  final TextInputType inputType;

  /// parent container padding
  final EdgeInsets padding;
  // padding container decoration
  final BoxDecoration? decoration;

  /// spacing between chips
  final double chipSpacing;

  /// style for chip text/label
  final TextStyle? chipTextStyle;

  /// style for text field
  final TextStyle? textStyle;

  /// backhround color of the chip
  final Color? chipBackgroundColor;

  /// custom delete icon
  final Widget? chipDeleteIcon;

  /// if true, displays a delete icon in the chip
  final bool chipCanDelete;

  /// Color for delete icon in the chip
  final Color? chipDeleteIconColor;

  final String? label;
  final bool lightLabelColor;

  final bool required;

  final String? Function(String?)? validator;

  final FocusNode? focusNode;

  const LabeledChipTextField({
    super.key,
    required this.onChanged,
    this.initialValue = const [],
    this.enabled = true,
    this.inputAction = TextInputAction.done,
    this.keyboardAppearance,
    this.textCapitalization = TextCapitalization.none,
    this.autofocus = false,
    this.inputDecoration = const InputDecoration(),
    this.textOverflow = TextOverflow.clip,
    this.inputType = TextInputType.text,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    this.chipCanDelete = true,
    this.chipSpacing = 5,
    this.maxChips,
    this.decoration,
    this.chipTextStyle,
    this.chipBackgroundColor,
    this.chipDeleteIcon,
    this.chipDeleteIconColor,
    this.textStyle,
    this.label,
    this.lightLabelColor = false,
    this.required = false,
    this.validator,
    this.focusNode,
  }) : assert(maxChips == null || initialValue.length <= maxChips);

  @override
  State<LabeledChipTextField> createState() => LabeledChipTextFieldState();
}

class LabeledChipTextFieldState extends State<LabeledChipTextField> {
  /// set of chips i.e. list of unique chips
  Set<String> chips = <String>{};

  /// controller for the input field
  final TextEditingController textCtrl = TextEditingController();

  /// checks whether the chips has reached the maximum number of chips allowed
  bool get _hasReachedMaxChips => widget.maxChips != null && chips.length >= widget.maxChips!;

  @override
  void initState() {
    chips.addAll(widget.initialValue);
    super.initState();
  }

  /// remove the chip from the list and calls [widget.onChanged]
  void deleteChip(String value) {
    if (widget.enabled) {
      setState(() => chips.remove(value));
      widget.onChanged(chips.toList(growable: false));
    }
  }

  /// adds the chip to the list, clear the text field and calls [widget.onChanged]
  void addChip(String value) {
    if (value.isEmpty || _hasReachedMaxChips) return;
    setState(() {
      chips.add(value.trim());
    });
    textCtrl.clear();
    widget.onChanged(chips.toList(growable: false));
  }

  /// sets the selected chip's value to the text field
  void onChipSelected(String value) {
    textCtrl.text = value;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final lightWhite = isDarkMode ? Colors.white54 : Colors.black54;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    const halfSpace = SizedBox(height: 6.0);
    return Container(
      padding: widget.padding,
      decoration: widget.decoration,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            Row(
              children: [
                Text(widget.label!,
                    style: mediumTextStyle?.copyWith(color: widget.lightLabelColor ? lightWhite : null)),
                if (widget.required) Text('*', style: mediumTextStyle?.copyWith(color: Colors.red)),
              ],
            ),
          halfSpace,
          Wrap(
              spacing: widget.chipSpacing,
              children: chips
                  .map((e) => Chip(
                        label: Text(e, overflow: widget.textOverflow),
                        onDeleted: widget.chipCanDelete ? () => deleteChip(e) : null,
                        deleteIcon: widget.chipDeleteIcon,
                        backgroundColor: widget.chipBackgroundColor,
                        labelStyle: widget.chipTextStyle ?? smallTextStyle,
                        deleteIconColor: widget.chipDeleteIconColor,
                      ))
                  .toList()),
          halfSpace,
          TextFormField(
            focusNode: widget.focusNode,
            autocorrect: false,
            controller: textCtrl,
            onFieldSubmitted: (value) => addChip(value),
            onChanged: (value) {
              if (value.contains(",")) addChip(value.replaceAll(",", ""));
            },
            onEditingComplete: () {}, // this prevents keyboard from closing
            onTapOutside: (_) {
              if (textCtrl.text.removeAllWhitespace.isNotEmpty) {
                addChip(textCtrl.text);
              }
            },
            decoration: widget.inputDecoration,
            validator: widget.validator,
            textInputAction: widget.inputAction,
            keyboardType: widget.inputType,
            keyboardAppearance: widget.keyboardAppearance,
            textCapitalization: widget.textCapitalization,
            enabled: widget.enabled,
            autofocus: widget.autofocus,
            style: widget.textStyle ?? smallTextStyle,
          ),
        ],
      ),
    );
  }
}
