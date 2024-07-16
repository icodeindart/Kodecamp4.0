import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/screens/task_screen.dart';
import 'package:todo_app/util/button_widget.dart';
import 'package:todo_app/util/cutomised_rich_text.dart';
import 'package:todo_app/util/empty_space_widget.dart';
import 'package:todo_app/util/login_screen_widgets.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  bool isAcceptTermsAndConditions = false;
  TextEditingController? name = TextEditingController();
  TextEditingController? email = TextEditingController();
  TextEditingController? password = TextEditingController();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  void acceptTermsAndConditions() {
    setState(() {
      widget.isAcceptTermsAndConditions = !widget.isAcceptTermsAndConditions;
    });
  }

  // void getName(value) {
  //   setState(() {
  //     name = value;
  //   });
  // }

  String? emailValidator(value) {
    if (value!.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
            .hasMatch(value)) {
      return 'Enter a valid Email';
    }
    return null;
  }

  String? nameValidator(value) {
    if (value!.isEmpty ||
        !RegExp(r"^[A-Za-z]+(?: [A-Za-z]+)*$").hasMatch(value)) {
      return 'Enter a valid name';
    }
    return null;
  }

  String? passwordValidator(value) {
    if (value!.isEmpty || value.length < 8) {
      return 'Must be at least 8 characters';
    }
    return null;
  }

  void submit() {
    final isValid = formKey.currentState!.validate();
    var isAcceptTermsAndConditions = !widget.isAcceptTermsAndConditions;
    if (!isValid || isAcceptTermsAndConditions) {
      return;
    }
    formKey.currentState!.save();

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TaskScreen(
            name: widget.name!.text,
          ),
        ));
  }

  late List customTextFieldDetails = [
    ['Name', nameValidator, TextInputType.text, widget.name],
    ['Email', emailValidator, TextInputType.emailAddress, widget.email],
    [
      'Password',
      passwordValidator,
      TextInputType.visiblePassword,
      widget.password
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CreateAnAccountText(),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const EmptySpace(20),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: customTextFieldDetails.length,
                  itemBuilder: (context, index) {
                    return CustomTextFormField(
                      label: customTextFieldDetails[index][0],
                      validatorFunction: customTextFieldDetails[index][1],
                      keyboardType: customTextFieldDetails[index][2],
                      controller: customTextFieldDetails[index][3],
                    );
                  }),
              const EmptySpace(55),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomisedRichText(
                        fontHeight: 17,
                        firstText: 'Accept',
                        firstColor: Colors.black,
                        secondText: ' Terms and conditions',
                        secondColor: Color(0xFF4959F4),
                      ),
                      AcceptTermsAndConditionsButton(
                        isAccept: widget.isAcceptTermsAndConditions,
                        acceptTermsAndConditions: acceptTermsAndConditions,
                      )
                    ]),
              ),
              const EmptySpace(55),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ButtonWidget(
                    buttonText: 'Submit',
                    action: submit,
                  ),
                ],
              ),
              const EmptySpace(25),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(),
                    ),
                    Text('Or register with'),
                    Expanded(child: Divider())
                  ],
                ),
              ),
              const EmptySpace(25),
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.google,
                      size: 24,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Google',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const EmptySpace(25),
              const CustomisedRichText(
                  firstText: 'You already have an account?',
                  secondText: ' Log In',
                  firstColor: Colors.grey,
                  secondColor: Colors.black,
                  fontHeight: 16)
            ],
          ),
        ),
      ),
    );
  }
}
