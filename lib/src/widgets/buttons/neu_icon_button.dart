// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:neubrutalism_ui/neubrutalism_ui.dart';

class NeuIconButton extends StatefulWidget {
  /// A customizable neubrutalist-style text button.
  ///
  /// The button has a text label, customizable background color, border color,
  /// and drop shadow. The button's shape can also be customized with a rounded
  /// border radius. The button's behavior is specified with an `onPressed`
  /// callback function.
  ///
  /// This button is built using Flutter's `Material` widget, and is designed to
  /// follow the Neubrutalism UI style guidelines.
  ///
  /// *[Constants]

  ///   - const neuBlack = Colors.black;
  ///   - const neuDefault1 = Colors.teal;
  ///   - const neuShadow = Color(0xFF080808);
  ///
  ///   - const neuBorder = 3.0;
  ///   - const neuShadowBlurRadius = 0.0;
  ///
  ///   - const neuOffset = Offset(4, 4);
  ///   - const neuBlurStyle = BlurStyle.solid;

  NeuIconButton({
    Key? key,
    required this.icon,
    required this.enableAnimation,
    this.buttonColor = neuDefault1,
    this.shadowColor = neuShadow,
    this.borderColor = neuBlack,
    this.onPressed,
    this.borderRadius,
    this.offset = neuOffset,
    this.buttonHeight = 50,
    this.buttonWidth = 50,
    this.shadowBlurRadius = neuShadowBlurRadius,
    this.borderWidth = neuBorder,
    this.animationDuration = 100,
  }) : super(key: key);

  /// - icon (required) : A Icon Widget to help you add icons.
  ///

  final Icon icon;

  /// - buttonColor (optional) : A Color that defines the color of the button.
  ///
  /// By default, it is set to neuDefault1 (black).
  final Color buttonColor;

  /// shadowColor (optional) : A Color that defines the color of the button's shadow.
  ///
  /// By default, it is set to neuShadow.
  ///
  final Color shadowColor;

  // - borderColor (optional) : A Color that defines the color of the button's border.
  //
  //By default, it is set to neuBlack.

  final Color borderColor;

  /// - onPressed (optional) : A callback function that is called when the button is pressed.
  ///
  final GestureTapCallback? onPressed;

  /// - borderRadius (optional) : A BorderRadiusGeometry that defines the border radius of the button.
  ///
  /// If not specified, the button will have a circular border radius.
  final BorderRadius? borderRadius;

  /// - offset : An Offset that defines the amount and direction of the blur applied to the shadow of the card.
  ///
  final Offset offset;

  /// - buttonHeight (optional) : A double value that defines the height of the button.
  ///
  final double buttonHeight;

  /// - buttonWidth (optional) : A double value that defines the width of the button.
  ///
  final double buttonWidth;

  /// - shadowBlurRadius (optional) : A double that defines the radius of the blur applied to the shadow of the card.
  ///
  /// By default, it is set to neuShadowBlurRadius.
  ///
  final double shadowBlurRadius;

  /// - borderWidth (optional) : A double value that defines the width of the button's border.
  ///
  /// By default, it is set to neuBorder.
  ///
  final double borderWidth;

  /// animate (required) : Boolean Property to toggle the Animation property of the Button Widget.
  ///
  /// Creates a smooth pressing animation beginning from Offset(0,0) to the defined [`offset`] property. (Default offset value is (4,4))
  final bool enableAnimation;

  ///animationDuration (optional) : An Int. defining the Animation Duration in milliseconds.
  ///
  ///Default value is 100ms
  final int animationDuration;

  @override
  State<NeuIconButton> createState() => NeuIconButtonState();
}

class NeuIconButtonState extends State<NeuIconButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animationDuration),
    );
    _animation = Tween<Offset>(begin: const Offset(0, 0), end: widget.offset)
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.enableAnimation) {
          _controller.forward().then((value) => _controller.reverse());
        }
        if (widget.onPressed != null) widget.onPressed!();
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, l) {
          return Transform.translate(
            offset: _animation.value,
            child: NeuContainer(
              width: widget.buttonWidth,
              height: widget.buttonHeight,
              borderRadius: widget.borderRadius,
              color: widget.buttonColor,
              borderColor: widget.borderColor,
              borderWidth: widget.borderWidth,
              shadowColor: widget.shadowColor,
              shadowBlurRadius: widget.shadowBlurRadius,
              offset: widget.offset,
              child: Center(
                child: widget.icon,
              ),
            ),
          );
        },
      ),
    );
  }
}
