import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  final Function action;
  final Widget child;
  final Duration duration;
  final String? keyName;
  const CustomElevatedButton({
    super.key,
    required this.action,
    required this.child,
    required this.duration,
    this.keyName,
  });

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        EasyDebounce.debounce(
          '${widget.keyName ?? 'custom_button'}',
          widget.duration,
          () => widget.action(),
        );
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      child: widget.child,
    );
  }
}
/*
 EasyRateLimit().rateLimit(
          '${widget.keyName ?? 'custom_button'}',
          widget.duration,
          () => widget.action(),
        );

*/ 