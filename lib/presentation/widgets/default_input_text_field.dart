import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sport_app/core/themes/app_assets.dart';

class DefaultInputTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final EdgeInsets padding;
  final String hintText;
  final String? placeText;
  final String? error;
  final bool isRequired;
  final InputBorder? border;
  final InputBorder? errorBorder;

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
    this.isRequired = false,
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
    bool hasError = isError;
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
                            text: widget.isRequired ? '${widget.hintText} ' : widget.hintText,
                            style: Theme.of(context).inputDecorationTheme.hintStyle!.copyWith(fontSize: _fontSize),
                          ),
                          if (widget.isRequired && !hasError)
                            TextSpan(
                              text: '*',
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                            ),
                        ],
                      ),
                    )),
                const SizedBox(width: 4.0),
                if (isError)
                  SvgPicture.asset(
                    AppSvg.passwordEye,
                    color: Theme.of(context).colorScheme.error,
                  ),
              ],
            ),
          ),
          TextFormField(
            controller: widget.textEditingController,
            focusNode: widget.focusNode,
            keyboardType: widget.keyboardType,
            style: Theme.of(context).textTheme.titleSmall,
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
              hintText: widget.placeText,
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
