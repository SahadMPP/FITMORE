import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  // late TextEditingController _nameEditcontroller;
  // late TextEditingController _phonenumberEditcontroller;
  // late TextEditingController _emailEditconstroller;
  // late UserModel _userModel;

  // int indexOfUserWithId(List<UserModel> userlist, String targetId) {
  //   return userlist.indexWhere((user) => user.id == targetId);
  // }

  // @override
  // void initState() {
  //   _nameEditcontroller = TextEditingController();
  //   _phonenumberEditcontroller = TextEditingController();
  //   _emailEditconstroller = TextEditingController();

  //   final userlist = userListNotifier.value;

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(left: 70),
          child: Text(
            'Edit Profile',
            style: TextStyle(
              color: Color.fromARGB(255, 123, 123, 123),
              fontSize: 22,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          // const SizedBox(height: 40),
          // const Text(
          //   'Edit Profile',
          //   textAlign: TextAlign.center,
          //   style: TextStyle(color: Colors.black, fontSize: 27),
          // ),
          const SizedBox(height: 62),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
            child: TextFormField(
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
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 25),
            child: TextFormField(
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Email",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: EdgeInsets.all(20),
                suffixIcon: Icon(Icons.email_sharp, color: Colors.grey),
                hintText: 'Enter your email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Padding(
          //   padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
          //   child: TextFormField(
          //     decoration: const InputDecoration(
          //       labelText: "Password",
          //       floatingLabelBehavior: FloatingLabelBehavior.always,
          //       contentPadding: EdgeInsets.all(20),
          //       suffixIcon: Icon(Icons.lock, color: Colors.grey),
          //       hintText: 'Enter your password',
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.all(Radius.circular(20)),
          //       ),
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 10),
          // Padding(
          //   padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
          //   child: TextFormField(
          //     decoration: const InputDecoration(
          //       labelText: "Conform Password",
          //       floatingLabelBehavior: FloatingLabelBehavior.always,
          //       contentPadding: EdgeInsets.all(20),
          //       suffixIcon: Icon(Icons.lock, color: Colors.grey),
          //       hintText: 'Enter your conform password',
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.all(Radius.circular(20)),
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: const Color.fromARGB(255, 236, 236, 236),
                    actionsPadding: const EdgeInsets.all(10),
                    title: const Text('Update your pasword'),
                    content: const SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            'Enter your old password',
                          ),
                          SizedBox(height: 10),
                          TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(10)),
                          ),
                          SizedBox(height: 10),
                          Text('Enter your new password'),
                          SizedBox(height: 10),
                          TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(10)),
                          ),
                          SizedBox(height: 10),
                          Text('Conform password'),
                          SizedBox(height: 10),
                          TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(10)),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(onPressed: () {}, child: const Text('Submit')),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close')),
                    ],
                  ),
                );
              },
              child: const Text(
                'Update your password',
                textAlign: TextAlign.end,
                style: TextStyle(decoration: TextDecoration.underline),
              ),
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
                onPressed: () {},
                child: const Text(
                  'Update',
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
    );
  }
}
