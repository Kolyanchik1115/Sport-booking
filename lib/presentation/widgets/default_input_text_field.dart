import 'package:flutter/material.dart';

class DefaultInputTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final EdgeInsets padding;
  final String hintText;
  final String? placeText;
  final String? error;
  final InputBorder? border;
  final InputBorder? errorBorder;
  final bool? filled;
  final TextStyle? hintStyle;
  final Widget? prefixIcon, suffixIcon;
  final double? prefixIconSize;
  final double? suffixIconSize;
  final TextInputType? keyboardType;
  final Function(String value)? onChanged;
  final Function()? onEditingComplete;
  final bool readOnly;
  final int? maxLines;

  const DefaultInputTextField({
    this.readOnly = false,
    required this.textEditingController,
    required this.focusNode,
    required this.hintText,
    this.padding = const EdgeInsets.symmetric(vertical: 16.0),
    this.error,
    this.keyboardType,
    this.onChanged,
    this.onEditingComplete,
    super.key,
    this.placeText,
    this.border,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconSize,
    this.suffixIconSize,
    this.maxLines,
    this.errorBorder,
    this.filled = false,
    this.hintStyle,
  });

  @override
  State<DefaultInputTextField> createState() => _DefaultInputTextFieldState();
}

class _DefaultInputTextFieldState extends State<DefaultInputTextField> {
  double _topPosition = 14.0;
  double _fontSize = 16;

  @override
  void initState() {
    super.initState();

    if (widget.textEditingController.text.isNotEmpty) _isFilledByDefault();
    widget.focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();

    widget.focusNode.removeListener(_onFocusChange);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedPositioned(
            left: 0.0,
            top: _topPosition,
            duration: const Duration(milliseconds: 200),
            child: Row(
              children: [
                AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: Theme.of(context).inputDecorationTheme.hintStyle!.copyWith(fontSize: _fontSize),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: widget.hintText,
                            style: Theme.of(context).inputDecorationTheme.hintStyle!.copyWith(fontSize: _fontSize),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(width: 4.0),
              ],
            ),
          ),
          TextFormField(
            controller: widget.textEditingController,
            focusNode: widget.focusNode,
            keyboardType: widget.keyboardType,
            style: Theme.of(context).textTheme.displayMedium,
            onChanged: widget.onChanged,
            onEditingComplete: widget.onEditingComplete,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            readOnly: widget.readOnly,
            maxLines: widget.maxLines,
            decoration: InputDecoration(
              focusedErrorBorder: widget.errorBorder,
              errorBorder: widget.errorBorder,
              enabledBorder: widget.border,
              focusedBorder: widget.border,
              errorText: errorText,
              filled: widget.filled,
              hintText: widget.placeText,
              hintStyle: widget.hintStyle,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
            ),
          ),
          if (isError)
            Positioned(
              right: 0.0,
              bottom: 0.0,
              child: Text(
                widget.error!,
                style: Theme.of(context).inputDecorationTheme.errorStyle,
              ),
            ),
        ],
      ),
    );
  }

  bool get isError {
    if (widget.error != null) {
      return true;
    }
    return false;
  }

  String? get errorText {
    return widget.error == null ? null : ' ';
  }

  void _isFilledByDefault() {
    setState(() {
      _fontSize = 12.0;
      _topPosition = -6.0;
    });
  }

  void _onFocusChange() {
    if (widget.textEditingController.text.isEmpty && widget.focusNode.hasFocus) {
      setState(() {
        _fontSize = 12.0;
        _topPosition = -6.0;
      });
    } else if (widget.textEditingController.text.isEmpty && !widget.focusNode.hasFocus) {
      setState(() {
        _fontSize = 16.0;
        _topPosition = 14.0;
      });
    }
  }
}
