import 'package:flutter/material.dart';
import 'package:pet_community_app/auth/auth.dart';
import 'package:useful_widgets/useful_widgets.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('설정'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 24,
            children: [
              _Span(
                title: '이메일',
                initialValue: 'totie@naver.com',
              ),
              _Span(
                title: '이름',
                initialValue: '김반려',
              ),
              _Span(
                title: '전화번호',
                initialValue: '010 2222 3242',
              ),
              _Span(
                title: '알림',
                initialValue: '혜택 및 이벤트 알림',
                switchValue: false,
                enabled: false,
              ),
              _Span(
                initialValue: '좋아요 알림',
                switchValue: true,
                enabled: false,
              ),
              _TextButton(
                text: '앱 정보',
                onTap: () {},
              ),
              _TextButton(
                text: '로그아웃',
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                    (route) => route.isFirst,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Span extends StatefulWidget {
  const _Span({
    super.key,
    this.title,
    this.enabled = true,
    this.initialValue,
    this.switchValue,
    this.onChanged,
    this.onSwitchUpdated,
  });

  final String? title;
  final bool enabled;
  final String? initialValue;
  final bool? switchValue;
  final void Function(String)? onChanged;
  final void Function(bool)? onSwitchUpdated;

  @override
  State<_Span> createState() => _SpanState();
}

class _SpanState extends State<_Span> {
  late final FocusNode _focus;
  late bool _isSelected;

  @override
  void initState() {
    super.initState();

    _focus = FocusNode();
    _isSelected = widget.switchValue ?? false;

    if (!widget.enabled) {
      _focus.addListener(() {
        if (_focus.hasFocus) _focus.unfocus();
      });
    }
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              widget.title!,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),
          ),
        TextInputField(
          focusNode: _focus,
          initialValue: widget.initialValue,
          enabledBorderSide: BorderSide.none,
          focusedBorderSide: BorderSide.none,
          disabledBorderSide: BorderSide.none,
          backgroundColor: const Color(0xFFF4F7FA),
          onChanged: widget.onChanged,
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          innerSuffixIcon: widget.switchValue == null
              ? null
              : Switch(
                  padding: const EdgeInsets.all(6),
                  value: _isSelected,
                  trackOutlineWidth: WidgetStateProperty.all(0),
                  trackOutlineColor: WidgetStateProperty.all(
                    Colors.transparent,
                  ),
                  thumbColor: WidgetStateProperty.all(Colors.white),
                  activeTrackColor: const Color(0xFF171A1F),
                  inactiveTrackColor: const Color(0xFFD8DCE5),
                  onChanged: (value) {
                    setState(() => _isSelected = value);
                  },
                ),
        ),
      ],
    );
  }
}

class _TextButton extends StatelessWidget {
  const _TextButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Color(0xFF8E95A3),
        ),
      ),
    );
  }
}
