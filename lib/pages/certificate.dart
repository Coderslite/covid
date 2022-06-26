import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart ' as pw;
import 'package:qr_flutter/qr_flutter.dart';

class CertificateScreen extends StatefulWidget {
  final String identityNumber;
  const CertificateScreen({Key? key, required this.identityNumber})
      : super(key: key);

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  getPdf() async {
    pw.Document pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Expanded(
            child: pw.Text("How are you"),
          );
        },
      ),
    );
    File pdfFile = File('Your path + File name');
    pdfFile.writeAsBytesSync(pdf.save());
  }

  // late String _inputErrorText;
  @override
  Widget build(BuildContextcontext) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vaccine Certificate"),
        backgroundColor: Colors.redAccent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      getPdf();
                    },
                    child: Text("Print Now")),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("registeredIndividual")
                .doc(widget.identityNumber)
                .snapshots(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text("Something went Wrong");
              }
              if (snapshot.hasData) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return certificateScreen(
                  context,
                  data,
                );
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }

  Container certificateScreen(BuildContext context, Map<String, dynamic> data) {
    return Container(
      color: const Color.fromARGB(255, 251, 251, 158),
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.only(top: 0, left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: Image.asset("images/logo.png"),
                        ),
                        const Text(
                          "Covid 19 Pass",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.red,
                            width: 2,
                          )),
                          padding: const EdgeInsets.all(5),
                          child: const Text(
                            "FULLY VACCINATED",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        )
                      ],
                    )
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("Name : "),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              data['name'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
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
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
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
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("Tel no : "),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              data['tel'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
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
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
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
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
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
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("Identity Number : "),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              data['identityNumber'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
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
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("FirstDOse : "),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              data['firstDose'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                    data['secondDose'] != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text("Vaccine Type : "),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                data['vaccineType'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        : const Text(""),
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
                  ],
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(
                bottom: 200,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Certificate No",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "5555s",
                        style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Issued Date",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        data['secondDose'] != ''
                            ? data['secondDose']
                            : data['firstDose'],
                        style: const TextStyle(
                            // fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  QrImage(
                    backgroundColor: Colors.white,
                    gapless: false,
                    embeddedImage: const AssetImage('images/logo.png'),
                    embeddedImageStyle: QrEmbeddedImageStyle(
                      size: const Size(50, 50),
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
                    size: 100.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
