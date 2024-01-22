import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sport_app/core/themes/app_assets.dart';

class PasswordInputTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final EdgeInsets padding;
  final String hintText;
  final String? error;
  final TextInputType? keyboardType;
  final Function(String value)? onChanged;
  final Function()? onEditingComplete;

  const PasswordInputTextField({
    required this.textEditingController,
    required this.focusNode,
    required this.hintText,
    this.padding = const EdgeInsets.symmetric(vertical: 16.0),
    this.error,
    this.keyboardType = TextInputType.visiblePassword,
    this.onChanged,
    this.onEditingComplete,
    super.key,
  });

  @override
  State<PasswordInputTextField> createState() => _PasswordInputTextFieldState();
}

class _PasswordInputTextFieldState extends State<PasswordInputTextField> {
  bool _obscureText = true;
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
                  child: Text(widget.hintText),
                ),
                const SizedBox(width: 4.0),
              ],
            ),
          ),
          TextFormField(
            controller: widget.textEditingController,
            focusNode: widget.focusNode,
            keyboardType: widget.keyboardType,
            obscureText: _obscureText,
            style: Theme.of(context).textTheme.displayMedium,
            onChanged: widget.onChanged,
            onEditingComplete: widget.onEditingComplete,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              errorText: errorText,
            ),
          ),
          Positioned(
            top: 0.0,
            bottom: isError ? 22.0 : 0.0,
            right: 0.0,
            child: InkWell(
              onTapDown: (_) {
                setState(() {
                  _obscureText = false;
                });
              },
              onTapUp: (_) {
                setState(() {
                  _obscureText = true;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  AppSvg.passwordEye,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          if (isError)
            Positioned(
              right: 0.0,
              bottom: -16.0,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.85,
                child: Text(
                  widget.error!,
                  style: Theme.of(context).inputDecorationTheme.errorStyle,
                  textAlign: TextAlign.right,
                  maxLines: 2,
                ),
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
