import 'package:flutter/material.dart';

class CalculadoraButton extends StatelessWidget {

  final Color fondoColor;
  final Color textoColor;
  final String texto;
  final Function onPressed;

  const CalculadoraButton({
    Key? key, 
    bgColor,
    textColor, 
    required this.texto, 
    required this.onPressed
  }): fondoColor = bgColor ?? Colors.white,
      textoColor = textColor ?? Colors.black,
      super(key: key);
      
  @override
  Widget build(BuildContext context) {
    // Button
    final buttonStyle = TextButton.styleFrom(
      foregroundColor: textoColor,
      backgroundColor: fondoColor,
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 3, color: const Color.fromARGB(255, 198, 198, 198)),
      ),
      margin: const EdgeInsets.only( bottom: 10, right: 3, left: 3 ),
      child: TextButton(
        style: buttonStyle,
        child: SizedBox(
          width: 95,
          height: 65,
          child: Center(
            child: Text( texto , style: const TextStyle( fontSize: 30, fontWeight: FontWeight.w300 ),)
          ),
        ),
        onPressed: () => onPressed(),
      ),
    );
  }
}