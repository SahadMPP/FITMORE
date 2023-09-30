import 'package:flutter/material.dart';

class AddAdress extends StatefulWidget {
  const AddAdress({super.key});

  @override
  State<AddAdress> createState() => _AddAdressState();
}

class _AddAdressState extends State<AddAdress> {
  final _formKey = GlobalKey<FormState>();

  final _nameEditcontroller = TextEditingController();
  final _phonenumberEditcontroller = TextEditingController();
  final _cityEditcontroller = TextEditingController();
  final _pincodeEditcontroller = TextEditingController();
  final _stateEditcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 50),
            child: Text(
              'Address',
              style: TextStyle(
                color: Color.fromARGB(255, 123, 123, 123),
                fontSize: 22,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Complete Profile',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 27),
            ),
            const SizedBox(height: 62),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
              child: TextFormField(
                controller: _nameEditcontroller,
                decoration: const InputDecoration(
                  labelText: "Name",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.all(20),
                  suffixIcon: Icon(Icons.person, color: Colors.grey),
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 25),
              child: TextFormField(
                controller: _phonenumberEditcontroller,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.all(20),
                  suffixIcon: Icon(Icons.phone_android, color: Colors.grey),
                  hintText: 'Enter your phone number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your number";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
              child: TextFormField(
                controller: _cityEditcontroller,
                decoration: const InputDecoration(
                  labelText: "City",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.all(20),
                  suffixIcon: Icon(Icons.place_outlined, color: Colors.grey),
                  hintText: 'Enter your city',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your city";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
              child: TextFormField(
                controller: _pincodeEditcontroller,
                decoration: const InputDecoration(
                  labelText: "Pincode",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.all(20),
                  suffixIcon: Icon(Icons.pin_drop_outlined, color: Colors.grey),
                  hintText: 'Enter your pincode',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your pincode";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
              child: TextFormField(
                controller: _stateEditcontroller,
                decoration: const InputDecoration(
                  labelText: "State",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.all(20),
                  suffixIcon: Icon(Icons.map_outlined, color: Colors.grey),
                  hintText: 'Enter your state',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your state";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(
                      Color.fromARGB(255, 255, 145, 0),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AddAdress(),
                      ));
                    }
                  },
                  child: const Text(
                    'Add Address',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
