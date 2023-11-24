import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key, required this.clave
  }) : super(key: key);

  final String clave;

  @override
  State<LoginForm> createState() => _LoginFormState();
}


class _LoginFormState extends State<LoginForm> {

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ctrlPhone = TextEditingController();
  final TextEditingController _ctrlPassword = TextEditingController();
  final Map<String, TextEditingController> formControllers = {
    'phone': TextEditingController(),
    'password': TextEditingController()
  };

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _ctrlPhone.dispose();
    _ctrlPassword.dispose();
    super.dispose();
  }


  List numeros = [0,1,2,3,4,5,6,7,8,9];
  String clave = '';
  bool visibility = false;

  void shuffleList() {
    setState(() {
      numeros.shuffle();
    });
  }

  void _add(String value) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      if(clave.length == 6){
        return;
      }
      clave = clave + value;
    });
  }

  void _remove() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      clave = clave.isNotEmpty ? clave.substring(0, clave.length - 1) : '';
    });
  }



  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            maxLength: 9,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            controller: _ctrlPhone,

            decoration: InputDecoration(

              counterText: "",

              labelText: 'Celular',
              // The MaterialStateProperty's value is a text style that is orange
              // by default, but the theme's error color if the input decorator
              // is in its error state.
              floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                    (Set<MaterialState> states) {
                  return const TextStyle(
                      color: kPrimaryColor,
                      letterSpacing: 1.3,
                      fontWeight: FontWeight.w600
                  );
                },
              ),

              // hintText: "Ingresa tu teléfono",
              prefixIcon: const Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Es necesario completar este campo.';
              }

              if (value.length < 9) {
                return 'Es número de celular no es válido.';
              }

              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(

              maxLength: 6,
              readOnly: true,
              textInputAction: TextInputAction.done,
              obscureText: !visibility,
              cursorColor: kPrimaryColor,
              controller: _ctrlPassword,
              decoration: InputDecoration(

                  counterText: "",

                  // hintText: "Clave (6 dígitos)",
                  labelText: "Clave (6 dígitos)",
                  // The MaterialStateProperty's value is a text style that is orange
                  // by default, but the theme's error color if the input decorator
                  // is in its error state.
                  floatingLabelStyle: MaterialStateTextStyle.resolveWith(
                        (Set<MaterialState> states) {
                      return const TextStyle(
                          color: kPrimaryColor,
                          letterSpacing: 1.3,
                          fontWeight: FontWeight.w600
                      );
                    },
                  ),

                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.lock),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 3, 0),
                    child: SizedBox(
                        height: 50,
                        width: 50,
                        child: IconButton(
                          color: Colors.black,
                          onPressed: () => {
                            setState( () => visibility = !visibility )
                          },
                          icon: Icon( visibility ? Icons.visibility_off :Icons.visibility),
                        )
                    )
                  )
              ),
              onTap: () async {
                await showInformationDialog(context,'').then((String? val) {
                  // ignore: avoid_print
                  // print(val);
                  if(val != null){
                    _ctrlPassword.text = val;
                  }

                  // formControllers['password']?.text = val ? val : '';
                  // setState(() {
                  //   clave = val;
                  // });
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Es necesario completar este campo.';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(

                    const SnackBar(
                        content: Text('Enviando datos...'),
                        behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      clave = widget.clave;
    });

    // ignore: avoid_print
    print('LoginForm ${widget.clave}');
  }


}


Future<String?> showInformationDialog(BuildContext context, String pass) async {
  return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {

        String password = pass;
        List numeros = [0,1,2,3,4,5,6,7,8,9];

        return StatefulBuilder(builder: (context, setState) {
          return Dialog(

            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(0.0),
            shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(20.0)),
            child: Container(
              alignment: Alignment.center,
              margin: null,
              padding: null,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              // constraints: BoxConstraints(maxHeight: 350),
              child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppBar(
                          leading: SizedBox(
                              child: IconButton(
                                icon: const Icon(Icons.close, color: Colors.black),
                                onPressed: () => Navigator.pop(context, null)
                              )
                          ),
                          backgroundColor: Colors.white
                      ),
                      const SizedBox(height: defaultPadding * 2),
                      Text(
                        password,
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      const Text(
                        "Ingresa tu clave",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      // Contador de caracteres
                      Row(
                        children: [
                          const Spacer(),
                          SizedBox(
                              width: 200,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  for (int i = 0; i < 6; i++)
                                    Container(
                                      width: 15,
                                      height: 15,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: kPrimaryColor, width: 1),
                                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                                          color: password.length >= (i+1) ? kPrimaryColor : null,
                                          boxShadow: password.length >= (i+1) ? const [
                                            BoxShadow(
                                              color: kPrimaryLightColor,
                                              spreadRadius: 3,
                                              blurRadius: 0,
                                              offset: Offset(0, 0), // changes position of shadow
                                            )] : null
                                      ),
                                    ),
                                ],
                              )
                          ),
                          const Spacer()
                        ],
                      ),
                      const SizedBox(height: defaultPadding * 2),



                      // Botones
                      Column(
                          children: <Widget>[
                            for(int i = 0; i < 4; i++)
                              if(i < 3)
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 270,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              for( int b = 0; b < 3 ; b++ )
                                                SizedBox(
                                                  width: 60,
                                                  height: 60,
                                                  child: ElevatedButton(
                                                    onPressed: (){
                                                      if(password.length == 6){
                                                        return;
                                                      }
                                                      setState(() {
                                                        // This call to setState tells the Flutter framework that something has
                                                        // changed in this State, which causes it to rerun the build method below
                                                        // so that the display can reflect the updated values. If we changed
                                                        // _counter without calling setState(), then the build method would not be
                                                        // called again, and so nothing would appear to happen.
                                                        password = password + numeros[(i*3)+b].toString();
                                                        if(password.length == 6){
                                                          Navigator.pop(context, password);
                                                        }
                                                      });
                                                    },
                                                    style: ButtonStyle(
                                                        backgroundColor: MaterialStateProperty.all(kPrimaryLightColor),
                                                        elevation: MaterialStateProperty.all(0.0)
                                                    ),
                                                    child: Text(numeros[(i*3)+b].toString(), style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: kPrimaryColor)),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: defaultPadding * 2),
                                  ],
                                )

                              else
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 270,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(width: 60,height: 60),
                                          SizedBox(
                                            width: 60,
                                            height: 60,
                                            child: ElevatedButton(
                                              onPressed: (){
                                                if(password.length == 6){
                                                  return;
                                                }
                                                setState(() {
                                                  // This call to setState tells the Flutter framework that something has
                                                  // changed in this State, which causes it to rerun the build method below
                                                  // so that the display can reflect the updated values. If we changed
                                                  // _counter without calling setState(), then the build method would not be
                                                  // called again, and so nothing would appear to happen.
                                                  password = password + numeros[9].toString();
                                                  if(password.length == 6){
                                                    Navigator.pop(context, password);
                                                  }
                                                });
                                              },
                                              style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all(kPrimaryLightColor),
                                                  elevation: MaterialStateProperty.all(0.0)
                                              ),
                                              child: Text(numeros[9].toString(), style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: kPrimaryColor)),
                                            ),
                                          ),
                                          SizedBox(
                                              width: 60,
                                              height: 60,
                                              child: IconButton(
                                                  color: kPrimaryColor,
                                                  icon: const Icon(Icons.backspace),
                                                  tooltip: 'Borrar',
                                                  style: ButtonStyle(
                                                      backgroundColor: MaterialStateProperty.all(Colors.white),
                                                      elevation: MaterialStateProperty.all(0.0)
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      // This call to setState tells the Flutter framework that something has
                                                      // changed in this State, which causes it to rerun the build method below
                                                      // so that the display can reflect the updated values. If we changed
                                                      // _counter without calling setState(), then the build method would not be
                                                      // called again, and so nothing would appear to happen.
                                                      password = password.isNotEmpty ? password.substring(0, password.length - 1) : '';
                                                    });
                                                  }
                                              )
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                          ]
                      ),
                    ],
                  )
              ),
            ),
          );
        });
      });
}