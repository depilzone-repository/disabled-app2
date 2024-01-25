import 'package:flutter/material.dart';
import 'package:flutter_auth/Services/auth_service.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/shared/services/auth_service.dart';
import 'package:flutter_auth/shared/services/shared_pref.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen>{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _ctrlUser = TextEditingController();
  final TextEditingController _ctrlPassword = TextEditingController();
  FocusNode? focusPasswordNode;

  bool _hasError = false;
  bool visibility = false;
  final bool _hasLoged = false;

  final auth = AuthService();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    focusPasswordNode = FocusNode();
    focusPasswordNode?.addListener(() {
      // log(123123);
    });

  }


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _ctrlUser.dispose();
    _ctrlPassword.dispose();
    focusPasswordNode?.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    SharedPref sharedPref = SharedPref();

    // final authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
        body: Center( child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultPadding*2),
            constraints: const BoxConstraints(
              maxWidth: 500
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 100),
                Image.asset("assets/images/logo-depilzone.png"),
                const SizedBox(height: 50),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Text("Ingresa tus datos para continuar", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: defaultPadding),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        cursorColor: kPrimaryColor,
                        onSaved: (email) {},
                        controller: _ctrlUser,

                        decoration: InputDecoration(

                          counterText: "",

                          labelText: 'Usuario',
                          labelStyle: MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                            final Color color = states.contains(MaterialState.error)
                                ? kWarningColor
                                : kGray500Color;
                            return TextStyle(
                                color: color,
                                fontWeight: FontWeight.w400
                            );
                          }),
                          floatingLabelStyle: MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                            final Color color = states.contains(MaterialState.error)
                                ? kWarningColor
                                : kGray500Color;

                            return TextStyle(
                                color: color,
                                letterSpacing: 1.3,
                                fontWeight: FontWeight.w500
                            );
                          },
                          ),

                          // hintText: "Ingresa tu teléfono",
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(defaultPadding),
                            child: Icon(FeatherIcons.user),
                          ),
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            _hasError = true;

                            /// refresh the state
                            setState(() {});

                            return 'Es necesario completar este campo.';
                          }


                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                        child: TextFormField(
                          focusNode: focusPasswordNode,
                          textInputAction: TextInputAction.none,
                          obscureText: !visibility,
                          cursorColor: kPrimaryColor,
                          controller: _ctrlPassword,
                          decoration: InputDecoration(
                              counterText: "",
                              labelText: "Clave",
                              labelStyle: MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                                final Color color = states.contains(MaterialState.error)
                                    ? kWarningColor
                                    : kGray500Color;
                                return TextStyle(
                                    color: color,
                                    fontWeight: FontWeight.w400
                                );
                              }),

                              floatingLabelStyle: MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                                final Color color = states.contains(MaterialState.error)
                                    ? kWarningColor
                                    : kGray500Color;

                                return TextStyle(
                                    color: color,
                                    letterSpacing: 1.3,
                                    fontWeight: FontWeight.w500
                                );
                              },
                              ),

                              prefixIcon: const Padding(
                                padding: EdgeInsets.all(defaultPadding),
                                child: Icon(FeatherIcons.lock),
                              ),
                              suffixIcon: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 3, 0),
                                  child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: IconButton(
                                        color: kGray500Color,
                                        onPressed: () async {
                                          setState(() {
                                            visibility = !visibility;
                                          });
                                        },
                                        icon: Icon( visibility ? FeatherIcons.eyeOff : FeatherIcons.eye),
                                      )
                                  )
                              )
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Es necesario completar este campo.';
                            }
                            return null;
                          },
                        ),
                      ),
                      // const SizedBox(height: defaultPadding),
                      const SizedBox(height: defaultPadding),
                      Hero(
                        tag: "login_btn",
                        child: ElevatedButton(
                          onPressed: () async {
                              if (_formKey.currentState!.validate()) {

                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                // dynamic snack = ScaffoldMessenger.of(context).showSnackBar(
                                //     SnackBar(
                                //     content: Text('Enviando datos...'),
                                //     behavior: SnackBarBehavior.floating,
                                //     duration: Duration(seconds: 1),
                                //   ),
                                // );

                                // log(_ctrlUser.text);
                                // log(_ctrlPassword.text);
                                // auth.login(_ctrlUser.text, _ctrlPassword.text).then((bool value) => {
                                //     if(value){
                                //         // Navegar a la pantalla principal
                                //         Navigator.pushReplacementNamed(context, '/home')
                                //     }
                                // });

                                // authBloc.add(const LoginEvent(
                                //   user:  User(username: 'nombre_de_usuario', password: 'contraseña'),
                                // ));

                                // Guardar el estado de inicio de sesión

                                // Usuario usuario = Usuario(correo: "pepelucho@gmail.com", hash: "asdfasdfsd-asdfasdfasdf-asdfasdf");
                                // usuario.nombre = "Pepe Lucho";
                                // usuario.apellido = "Sanchez";


                                await Login(_ctrlUser.text, _ctrlPassword.text)
                                    .then((value) async{


                                        await sharedPref.save('user', value.toJson());
                                        Navigator.pushReplacementNamed(context, '/home');
                                    })
                                    .catchError((err){
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('${err.message}'),
                                          behavior: SnackBarBehavior.floating,
                                          duration: const Duration(seconds: 3),
                                        ),
                                      );
                                    });
                              }
                          },
                          child: const Text(
                            "Ingresar",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        )
    )
    );
  }
}