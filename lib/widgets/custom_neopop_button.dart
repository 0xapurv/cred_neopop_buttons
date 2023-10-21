import 'package:flutter/material.dart';

class CustomNeoPopButton extends StatefulWidget {
  const CustomNeoPopButton(
      {Key? key,
      required this.height,
      required this.width,
      required this.color,
      required this.buttonText,
      required this.onPressed,
      required this.borderColor})
      : super(key: key);
  final double height;
  final double width;
  final Color color;
  final Color borderColor;
  final Widget buttonText;
  final Function onPressed;

  @override
  _CustomNeoPopButtonState createState() => _CustomNeoPopButtonState();
}

class _CustomNeoPopButtonState extends State<CustomNeoPopButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    _animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(8, 8),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) {
          _controller.reverse();
          widget.onPressed;
        });
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          return Stack(
            children: [
              Container(
                height: widget.height,
                width: widget.width,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(8, 8),
                      )
                    ]),
              ),
              Transform.translate(
                offset: _animation.value,
                child: Container(
                  height: widget.height,
                  width: widget.width,
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: widget.borderColor, width: 2),
                  ),
                  child: DefaultTextStyle(
                    style: const TextStyle(fontSize: 16),
                    child: Center(
                      child: widget.buttonText,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}