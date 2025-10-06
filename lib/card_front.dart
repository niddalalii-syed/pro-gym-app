import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardFront extends StatefulWidget {
  const CardFront({super.key});

  @override
  State<CardFront> createState() => _CardFrontState();
}

final TextEditingController _initialyear = TextEditingController();
final TextEditingController _finalyear = TextEditingController();
final TextEditingController _name = TextEditingController();
final TextEditingController _dateofjoining = TextEditingController();
final TextEditingController _contact = TextEditingController();
final TextEditingController _gender = TextEditingController();

var gender = ['Male', 'Female'];
String genderinitial = 'Male';

class _CardFrontState extends State<CardFront> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Fill'),
        centerTitle: true,
        leading: const Icon(Icons.clear),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Container(
            decoration:
                BoxDecoration(border: 
                Border.all(color: Colors.orange, width: 4)),
            height: 480,
            width: 300,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.asset('assets/icon.png')),
                  Text('PRO GYM',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ))
                ],
              ),
              const Text(
                'B-17, Block-2, Gulistan-e-Jauhar, Karachi',
                style: TextStyle(color: Colors.orange),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 23,
                      width: 23,
                      child: Image.asset('assets/whatsApp.png')),
                  const Text(
                    '0332-3558673, 0332-3772013',
                    style: TextStyle(color: Colors.orange),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('For the year 20',
                      style: TextStyle(
                        color: Colors.orange,
                      )),
                  SizedBox(
                    width: 18,
                    height: 18,
                    child: TextField(
                      controller: _initialyear,
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      decoration: const InputDecoration(counterText: ''),
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                  const Text(' to 20',
                      style: TextStyle(
                        color: Colors.orange,
                      )),
                  SizedBox(
                    width: 18,
                    height: 18,
                    child: TextField(
                      controller: _finalyear,
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      decoration: const InputDecoration(counterText: ''),
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                color: Colors.orange,
                width: 250,
                child: const Text(
                  'GYM MEMBERSHIP CARD',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Name: ',
                      style: TextStyle(color: Colors.orange),
                    ),
                    SizedBox(
                      width: 220,
                      height: 25,
                      child: TextField(
                        controller: _name,
                        // keyboardType: TextInputType,
                        maxLength: 31,
                        decoration: const InputDecoration(counterText: ''),
                        style: const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Date Of joining: ',
                      style: TextStyle(color: Colors.orange),
                    ),
                    SizedBox(
                      width: 164,
                      height: 25,
                      child: TextField(
                        controller: _dateofjoining,
                        // keyboardType: TextInputType,
                        maxLength: 31,
                        decoration: const InputDecoration(counterText: ''),
                        style: const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Contact No: ',
                      style: TextStyle(color: Colors.orange),
                    ),
                    SizedBox(
                      width: 184,
                      height: 25,
                      child: TextField(
                        controller: _contact,
                        keyboardType: TextInputType.phone,
                        maxLength: 11,
                        decoration: const InputDecoration(counterText: ''),
                        style: const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Gender: ',
                      style: TextStyle(color: Colors.orange),
                    ),
                    SizedBox(
                        width: 100,
                        height: 50,
                        child: DropdownButton(
      
                            // Initial Value
                            value: genderinitial,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),
                            // Array list of items
                            items: gender.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                // gender = newValue!;
                              });
                            }))
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.orange,
                ),
                height: 25,
                width: 180,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Proceed to next page',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
