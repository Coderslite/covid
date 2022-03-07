import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_19/pages/check_identity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreemState();
}

class _LoginScreemState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: Image.asset("images/logo.png"),
                ),
                FormBuilderTextField(
                    name: 'email',
                    autofocus: false,
                    // controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.email(context)
                    ]),
                    onSaved: (value) {
                      // emailController.text = value!;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.mail),
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                FormBuilderTextField(
                    name: 'password',
                    autofocus: false,
                    // controller: passwordController,
                    obscureText: true,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.minLength(context, 6)
                    ]),
                    onSaved: (value) {
                      // passwordController.text = value!;
                    },
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.vpn_key),
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.redAccent,
                  child: MaterialButton(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    minWidth: MediaQuery.of(context).size.width,
                    onPressed: () {
                      handleLogin();
                    },
                    child: const Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Dont have an account ? "),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Register Now",
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  handleLogin() {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      final formData = _formKey.currentState!.value;
      FirebaseFirestore.instance
          .collection("users")
          .where("email", isEqualTo: formData['email'])
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          if (doc['status'] == 'verifier' &&
              doc['password'] == formData['password']) {
            // print('verifier');
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return CheckIdentity();
            }));
          }
          if (doc['status'] == 'patient') {
            print('patient');
          }
          if (doc['status'] == 'admin') {
            print('patient');
          }
        });
        // print();
      }).catchError((e) {
        print(e.message);
      });
    }
  }
}
