import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class VerifierAdd extends StatefulWidget {
  const VerifierAdd({
    Key? key,
  }) : super(key: key);

  @override
  State<VerifierAdd> createState() => _VerifierAddState();
}

class _VerifierAddState extends State<VerifierAdd> {
  bool obscure = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: FormBuilder(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Register new verifier",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            name: 'name', // controller: emailController,
            keyboardType: TextInputType.name,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
            ]),
            onSaved: (value) {
              // emailController.text = value!;
            },
            textInputAction: TextInputAction.next,
            cursorColor: Colors.redAccent,
            style: const TextStyle(color: Colors.black),

            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.mail, color: Colors.redAccent),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "Name",
              hintStyle: TextStyle(color: Colors.red.withOpacity(0.6)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.redAccent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.redAccent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.redAccent),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            name: 'email', // controller: emailController,
            keyboardType: TextInputType.name,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
            ]),
            onSaved: (value) {
              // emailController.text = value!;
            },
            textInputAction: TextInputAction.next,
            cursorColor: Colors.redAccent,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.mail, color: Colors.redAccent),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "Email",
              hintStyle: TextStyle(color: Colors.red.withOpacity(0.6)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.redAccent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.redAccent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.redAccent),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            name: 'password', // controller: emailController,
            keyboardType: TextInputType.name,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
            ]),
            onSaved: (value) {
              // emailController.text = value!;
            },
            textInputAction: TextInputAction.next,
            cursorColor: Colors.redAccent,
            obscureText: obscure,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscure = !obscure;
                    });
                  },
                  icon: obscure
                      ? Icon(Icons.visibility, color: Colors.redAccent)
                      : Icon(Icons.visibility_off, color: Colors.redAccent)),
              prefixIcon: const Icon(Icons.vpn_key, color: Colors.redAccent),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.red.withOpacity(0.6)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.redAccent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.redAccent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.redAccent),
              ),
            ),
          ),
          SizedBox(
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
                // handleLogin();
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
        ],
      )),
    );
  }
}
