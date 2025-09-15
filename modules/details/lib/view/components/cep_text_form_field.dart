import 'package:flutter/material.dart';

class ValidatedTextFormField extends StatefulWidget {
  final FormFieldValidator Function(bool isValid) formValidator;

  const ValidatedTextFormField({super.key, required this.formValidator});

  @override
  State<ValidatedTextFormField> createState() => _ValidatedTextFormFieldState();
}

class _ValidatedTextFormFieldState extends State<ValidatedTextFormField> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  bool _isValid = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _controller,
            validator: widget.formValidator(_isValid),
            decoration: InputDecoration(
              labelText: "Digite algo",
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green, width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 2),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 2),
              ),
            ),
            onChanged: (_) => setState(() {
              _formKey.currentState?.validate();
            }),
          ),
          const SizedBox(height: 8),
          Text(
            _isValid
                ? "Cep válido!"
                : (_formKey.currentState?.validate() == false
                    ? "Inválido"
                    : ""),
            style: TextStyle(
              color: _isValid ? Colors.green : Colors.red,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
