import 'package:flutter_calculadora/controllers/calculadora_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'operacion.dart';
import 'resultado.dart';

class CalculoMat extends StatelessWidget {
  
  final calculatorCtrl = Get.find<CalculatorController>();

  @override
  Widget build(BuildContext context) {
    
    return Obx( 
      () => Column(
        children: [ 
          SubResult( text: '${ calculatorCtrl.primerNumero }' ),
          SubResult( text: '${ calculatorCtrl.operacion }' ),
          SubResult( text: '${ calculatorCtrl.segundoNumero }' ),
          SubResult( text: '${ calculatorCtrl.signoResult }' ),
          MainResultText( text: '${ calculatorCtrl.resultado }' ),
        ],
    ));
  }
}
