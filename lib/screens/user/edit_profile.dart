import 'package:e_commerce/Widgets/change_password.dart';
import 'package:e_commerce/Widgets/h1_headline.dart';
import 'package:e_commerce/Widgets/mainbutton.dart';
import 'package:e_commerce/Widgets/text_field_reg.dart';
import 'package:e_commerce/data_base/function/user_functions.dart';
import 'package:e_commerce/data_base/models/user/db_model.dart';
import 'package:e_commerce/user_functions/edit_profile_func.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  GlobalKey<FormState> foemKey = GlobalKey<FormState>();
  late TextEditingController _nameEditcontroller;
  late TextEditingController _phonenumberEditcontroller;
  late TextEditingController _emailEditconstroller;
  late TextEditingController _dbPasswordcontroller;

  final _oldPasswordEditcontroller = TextEditingController();
  final _newPasswordEditcontroller = TextEditingController();
  final _conformPasswordEditconstroller = TextEditingController();

  late UserModel _userModel;

  @override
  void initState() {
    _nameEditcontroller = TextEditingController();
    _phonenumberEditcontroller = TextEditingController();
    _emailEditconstroller = TextEditingController();
    _dbPasswordcontroller = TextEditingController();

    final userlist = userListNotifier.value;

    if (userlist.isNotEmpty) {
      _userModel = userlist[1];
      _nameEditcontroller.text = _userModel.name!;
      _phonenumberEditcontroller.text = _userModel.phoneNumber!;
      _emailEditconstroller.text = _userModel.email!;
      _dbPasswordcontroller.text = _userModel.password!;
    }
    super.initState();
  }

  @override
  void dispose() {
    _nameEditcontroller.dispose();
    _phonenumberEditcontroller.dispose();
    _emailEditconstroller.dispose();
    _dbPasswordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 40),
          const H1headline(text: 'Edit Profile'),
          const SizedBox(height: 62),
          TextFieldInReg(
            icon: Icons.person,
            labelText: "Name",
            hintText: 'Enter your name',
            validatorText: 'Field is Empty',
            keyboardType: TextInputType.name,
            obscureText: false,
            maxLength: null,
            nameController: _nameEditcontroller,
          ),
          const SizedBox(height: 15),
          TextFieldInReg(
            icon: Icons.phone_android,
            labelText: "Phone Number",
            hintText: 'Enter your phone number',
            validatorText: 'Field is Empty',
            keyboardType: TextInputType.phone,
            obscureText: false,
            maxLength: null,
            nameController: _phonenumberEditcontroller,
          ),
          const SizedBox(height: 15),
          TextFieldInReg(
            icon: Icons.email_sharp,
            labelText: "Email",
            hintText: 'Enter your email',
            validatorText: 'Field is Empty',
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            maxLength: null,
            nameController: _emailEditconstroller,
          ),
          const SizedBox(height: 10),
          ChangePasswordWidget(
              foemKey: foemKey,
              oldPasswordEditcontroller: _oldPasswordEditcontroller,
              newPasswordEditcontroller: _newPasswordEditcontroller,
              conformPasswordEditconstroller: _conformPasswordEditconstroller,
              dbPasswordcontroller: _dbPasswordcontroller,
              userModel: _userModel),
          const SizedBox(height: 18),
          Button(
              text: 'Update',
              onPressedCallback: () {
                updateUserdetailsOnAclike(
                    nameEditcontroller: _nameEditcontroller,
                    phonenumberEditcontroller: _phonenumberEditcontroller,
                    emailEditconstroller: _emailEditconstroller,
                    userModel: _userModel);
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }
}
