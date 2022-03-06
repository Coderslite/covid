import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CertificateScreen extends StatefulWidget {
  final String id;
  const CertificateScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  // late String _inputErrorText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vaccine Certificate"),
        backgroundColor: Colors.redAccent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Print Now"),
              ],
            ),
          ),
        ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("registeredIndividual")
              .doc(widget.id)
              .snapshots(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went Wrong");
            }
            if (snapshot.hasData) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: Image.asset("images/logo.png"),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(
                          height: 20,
                        ),
                        Text("Personal Information"),
                        Divider(),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Name : "),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          data['name'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Email : "),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          data['email'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Gender"),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          data['gender'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Tel no : "),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          data['tel'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Address : "),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          data['address'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Date of Birth : "),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          data['dob'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Official Information"),
                        Divider(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Identity Number : "),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          data['identityNumber'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Vaccine Type : "),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          data['vaccineType'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text("Status : "),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Vacinnated",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        QrImage(
                          gapless: false,
                          embeddedImage: AssetImage('images/logo.png'),
                          embeddedImageStyle: QrEmbeddedImageStyle(
                            size: Size(50, 50),
                          ),
                          data: "Name: " +
                              data['name'] +
                              " " +
                              "Identity Number: " +
                              data['identityNumber'] +
                              " " +
                              "Vaccine Type:" +
                              data['vaccineType'],
                          version: QrVersions.auto,
                          size: 200.0,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
