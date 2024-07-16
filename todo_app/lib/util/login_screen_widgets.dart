import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/util/empty_space_widget.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField(
      {this.validatorFunction,
      required this.label,
      this.controller,
      super.key,
      this.suffixIcon,
      this.keyboardType});
  final String label;
  TextEditingController? controller;

  Widget? suffixIcon;
  final String? Function(String?)? validatorFunction;
  final TextInputType? keyboardType;
  bool hiddenText = true;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  void hideText() {
    setState(() {
      widget.hiddenText = !widget.hiddenText;
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.label != 'Password') {
      widget.hiddenText = false;
    } else {
      widget.suffixIcon = IconButton(
          onPressed: () {
            hideText();
          },
          icon: const Icon(Icons.remove_red_eye_outlined));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const EmptySpace(10),
          TextFormField(
            controller: widget.controller,
            obscureText: widget.hiddenText,
            validator: widget.validatorFunction,
            keyboardType: widget.keyboardType,
            style: const TextStyle(fontSize: 18, color: Colors.black),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.grey.shade100),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.grey.shade100),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.grey.shade100),
              ),
              suffixIcon: widget.suffixIcon,
            ),
          )
        ],
      ),
    );
  }
}

class CreateAnAccountText extends StatelessWidget {
  const CreateAnAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        EmptySpace(30),
        Text(
          'Create an Account',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class AcceptTermsAndConditionsButton extends StatefulWidget {
  AcceptTermsAndConditionsButton(
      {required this.isAccept,
      required this.acceptTermsAndConditions,
      super.key});
  bool isAccept;
  AlignmentGeometry select = Alignment.centerLeft;
  void Function() acceptTermsAndConditions;
  @override
  State<AcceptTermsAndConditionsButton> createState() =>
      _AcceptTermsAndConditionsButtonState();
}

class _AcceptTermsAndConditionsButtonState
    extends State<AcceptTermsAndConditionsButton> {
  void onTap() {
    widget.acceptTermsAndConditions();
    setState(() {
      widget.isAccept = !widget.isAccept;
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.select =
        widget.isAccept ? Alignment.centerRight : Alignment.centerLeft;
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 0.5),
            color: widget.isAccept ? Colors.grey.shade100 : Colors.grey),
        // color: Colors.grey,
        width: 50,
        child: Align(
            alignment: widget.select,
            child: const Icon(
              color: Color(0xFF4959F4),
              Icons.circle,
            )),
      ),
    );
  }
}
