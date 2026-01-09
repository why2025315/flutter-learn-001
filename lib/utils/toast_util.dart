import 'package:flutter/material.dart';

OverlayEntry? _overlayEntry;

/// 显示顶部提示框
/// [context] 上下文
/// [msg] 提示文字
/// [bgColor] 背景色
/// [duration] 显示时长
void showTopToast(
  BuildContext context,
  String msg, {
  Color bgColor = Colors.green,
  Duration duration = const Duration(seconds: 2),
}) {
  if (_overlayEntry != null && _overlayEntry!.mounted) {
    _overlayEntry!.remove();
  }
  _overlayEntry = null;
  _overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).padding.top + 20,
      left: 16,
      right: 16,
      child: Material(
        color: Colors.transparent,
        child: AnimatedOpacity(
          opacity: 1,
          duration: const Duration(microseconds: 200),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 4),
              ],
            ),
            child: Text(
              msg,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
      ),
    ),
  );
  Overlay.of(context)!.insert(_overlayEntry!);
  Future.delayed(duration, () {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  });
}
