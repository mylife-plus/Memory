import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pinput/pinput.dart';
import 'package:pin_keyboard/pin_keyboard.dart';

class PinSetupScreen extends StatefulWidget {
  const PinSetupScreen({Key? key}) : super(key: key);

  @override
  State<PinSetupScreen> createState() => _PinSetupScreenState();
}

class _PinSetupScreenState extends State<PinSetupScreen> {


  bool _pinConfirmed = false;
  String pinCode = "";
  String pinCodeConfirm = "";

  final TextEditingController controller = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Pinput(
            controller: controller,
          ),
          !_pinConfirmed
              ? Text("Please Type your Pin Code")
              : Text("Please Confirm your Pin Code"),
          PinKeyboard(
            length: 4,
            onChange: (e) => setState(() {
              controller.setText(e);
            }),
            iconBackspace: Icon(Icons.backspace_outlined),
            iconBackspaceColor: Colors.black,
          ),
          controller.value.text.length == 4
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ElevatedButton(
                      onPressed: () => _confirmPin(),
                      child:  SizedBox(
                          height: 60,
                          width: 180,
                          child: Center(child:Text( _pinConfirmed ?'Confirm':'Submit')))),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }

  _confirmPin() async {

    if(!_pinConfirmed){
      setState(() {
        pinCode = controller.value.text;
        _pinConfirmed = true;
        controller.clear();
      });
  }
  else{
    setState(() {
      pinCodeConfirm = controller.value.text;
      controller.clear();
    });
    if(pinCode == pinCodeConfirm){
      String _privateKey = ModalRoute.of(context)?.settings.arguments as String;
      print(_privateKey);
      var box = await Hive.openBox("config");


      box.put("pinCode", pinCode);
      box.put(pinCode, _privateKey);
      Navigator.of(context).pushReplacementNamed("home");

    }
    else{
      setState(() {
        _pinConfirmed = false;
      });
    }
  }
  }
}
