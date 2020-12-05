import 'package:flutter/material.dart';

class VigenereScreen extends StatefulWidget {
  @override
  _VigenereScreenState createState() => _VigenereScreenState();
}

class _VigenereScreenState extends State<VigenereScreen> {
  String _result = "";
  final TextEditingController inputController = TextEditingController();
  final TextEditingController keyController = TextEditingController();
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vigenere Cipher Dechipher'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              //key
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  controller: keyController,
                  decoration: InputDecoration(
                    labelText: "Key",
                    labelStyle: TextStyle(
                      color: Color(0xFF1D3557),
                      fontWeight: FontWeight.bold,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color(0xFF1D3557),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color(0xFF1D3557),
                        width: 2.0,
                      ),
                    ),
                    focusColor: Color(0xFF1D3557),
                  ),
                ),
              ),

              //text
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  controller: inputController,
                  decoration: InputDecoration(
                    labelText: "Enter text",
                    labelStyle: TextStyle(
                      color: Color(0xFF1D3557),
                      fontWeight: FontWeight.bold,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color(0xFF1D3557),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color(0xFF1D3557),
                        width: 2.0,
                      ),
                    ),
                    focusColor: Color(0xFF1D3557),
                  ),
                ),
              ),

              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //encrypt button
                  FlatButton(
                    onPressed: encipher,
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          'Encrypt',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  //decrypt button
                  FlatButton(
                    onPressed: decipher,
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          'Decrypt',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40),
              Text(
                'Hasil',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Text(
                _result,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void decipher() {
    var shift = keyController.text;
    var text = inputController.text;
    VigenereCipher enc = new VigenereCipher(shift);
    _result = enc.decrypt(text);
    setState(() {});
  }
  void encipher() {
    var shift = keyController.text;
    var text = inputController.text;
    VigenereCipher enc = new VigenereCipher(shift);
    _result = enc.encrypt(text);
    setState(() {});
  }
}

class VigenereCipher {
  String key;
  VigenereCipher(this.key);
  String encrypt(String input) {
    key = this.key;
    input = input.replaceAll(' ', '');
    key = key.replaceAll(' ', '');
    input = input.toUpperCase();
    key = key.toUpperCase();
    String output = "";
    int j = 0;
    for (int i = 0; i < input.length; i++) {
      if (input[i].isNotEmpty) {
        output += String.fromCharCode(
            (input.codeUnitAt(i) + key.codeUnitAt(j)) % 26 + 65);
      } else {
        output += input[i];
      }
      if (j < key.length - 1) {
        j++;
      } else {
        j = 0;
      }
    }
    return output;
  }

  String decrypt(String input) {
    key = this.key;
    input = input.replaceAll(' ', '');
    key = key.replaceAll(' ', '');
    input = input.toUpperCase();
    key = key.toUpperCase();
    String output = "";
    int j = 0;

    for (int i = 0; i < input.length; i++) {
      if (input[i].isNotEmpty) {
        output += String.fromCharCode(
            (input.codeUnitAt(i) - key.codeUnitAt(j)) % 26 + 65);
      } else {
        output += input[i];
      }

      if (j < key.length - 1)
        j++;
      else
        j = 0;
    }
    return output;
  }
}

