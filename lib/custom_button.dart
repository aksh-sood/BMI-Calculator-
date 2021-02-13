import 'package:flutter/material.dart';
class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon,@required this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child:Icon(icon),
      onPressed: onPressed,
      elevation: 15,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0XFF4C4F5E),
    );
  }
}
class CustomElevation extends StatelessWidget {
  final Widget child;
  final Color color;
  CustomElevation({@required this.child,@required this.color}) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: color,
            blurRadius:3,
            offset: Offset(-6, 7),
          ),
        ],
      ),
      child: this.child,
    );
  }
}
