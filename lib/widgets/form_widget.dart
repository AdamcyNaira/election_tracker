import 'package:election_tracker/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

Widget inputLabel({String? title}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 10.0),
        child: Text(
          title!,
          style: const TextStyle(
              fontSize: 12, color: Colors.black87, fontWeight: FontWeight.w600),
        ),
      ),
      const YMargin(10),
    ],
  );
}

Widget inputLabelWithoutPadding({String? title}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 0.0, top: 10.0),
        child: Text(
          title!,
          style: const TextStyle(
              fontSize: 12, color: Colors.black87, fontWeight: FontWeight.w600),
        ),
      ),
      const YMargin(10),
    ],
  );
}

Widget usernameInput({
  TextEditingController? controller,
  FormFieldSetter? onSave,
  FormFieldValidator<String>? validator,
  TextInputType? keyboardType,
  TextStyle? style,
  IconData? prefixIcon,
  Color? iconColor,
  String? hintText,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 10.0),
    child: TextFormField(
      controller: controller,
      onSaved: onSave,
      validator: validator,
      keyboardType: keyboardType,
      style: style,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(
          prefixIcon,
          color: iconColor,
        ),
        hintStyle: const TextStyle(
          fontSize: 12,
          color: Colors.black54,
          fontWeight: FontWeight.w500,
        ),
        contentPadding: const EdgeInsets.all(20.0),
        filled: true,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

class PasswordInpute extends StatefulWidget {
  const PasswordInpute({
    Key? key,
    this.controller,
    this.hintText,
    this.iconColor,
    this.keyboardType,
    this.onSave,
    this.onChanged,
    this.prefixIcon,
    this.style,
    this.suffixIconColor,
    this.suffixIconVisibility,
    this.suffixIconVisibilityOff,
    this.validator,
  }) : super(key: key);

  final TextEditingController? controller;
  final Function(String?)? onSave;
  final Function(String?)? onChanged;
  final FormFieldValidator? validator;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final IconData? prefixIcon;
  final Color? iconColor;
  final String? hintText;
  final IconData? suffixIconVisibility;
  final IconData? suffixIconVisibilityOff;
  final Color? suffixIconColor;

  @override
  _PasswordInputeState createState() => _PasswordInputeState();
}

class _PasswordInputeState extends State<PasswordInpute> {
  bool? passwordView = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 10.0),
      child: TextFormField(
        controller: widget.controller,
        onSaved: widget.onSave,
        onChanged: widget.onChanged,
        validator: widget.validator,
        obscureText: passwordView!,
        keyboardType: widget.keyboardType,
        style: widget.style,
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.prefixIcon,
            size: 20.0,
            color: widget.iconColor,
          ),
          suffixIcon: IconButton(
              icon: Icon(
                passwordView == true
                    ? widget.suffixIconVisibility
                    : widget.suffixIconVisibilityOff,
                size: 20.0,
                color: widget.suffixIconColor,
              ),
              onPressed: () {
                if (passwordView == true) {
                  setState(() {
                    passwordView = false;
                    // icon = hideCode;
                  });
                } else {
                  setState(() {
                    passwordView = true;
                    // icon = hideCode;
                  });
                }
              }),
          hintText: widget.hintText,
          contentPadding: const EdgeInsets.all(20.0),
          filled: true,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

Widget buildTextInput({
  TextEditingController? controller,
  Function(String?)? onSave,
  Function(String?)? onChanged,
  FormFieldValidator<String>? validator,
  TextInputType? keyboardType,
  TextStyle? style,
  IconData? prefixIcon,
  Color? iconColor,
  String? hintText,
  FocusNode? textfield,
  bool readOnly = false,
  int? maxLength,
  int? maxLines,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10),
    child: TextFormField(
      controller: controller,
      onSaved: onSave,
      onChanged: onChanged,
      readOnly: readOnly,
      focusNode: textfield,
      validator: validator,
      maxLength: maxLength,
      maxLines: maxLines,
      keyboardType: keyboardType,
      textCapitalization: TextCapitalization.sentences,
      style: const TextStyle(
        fontSize: 14,
        color: Color(0XFF464646),
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 12,
          color: Colors.black54,
          fontWeight: FontWeight.w500,
        ),
        contentPadding: const EdgeInsets.all(15.0),
        filled: true,
        fillColor: Colors.grey[150],
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

Widget buildNumberInput({
  TextEditingController? controller,
  Function(String?)? onSave,
  FormFieldValidator<String>? validator,
  TextInputType? keyboardType,
  TextStyle? style,
  IconData? prefixIcon,
  Color? iconColor,
  String? hintText,
  FocusNode? textfield,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 10.0, bottom: 10),
    child: TextFormField(
      controller: controller,
      onSaved: onSave,
      focusNode: textfield,
      validator: validator,
      keyboardType: keyboardType,
      onTap: () {},
      textCapitalization: TextCapitalization.sentences,
      style: const TextStyle(
        fontSize: 14,
        color: Color(0XFF464646),
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.inter(
          color: Constants.kTitleColor.withOpacity(0.6),
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.all(15.0),
        filled: true,
        fillColor: Colors.grey[150],
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

Widget buildDropDownBtn({
  TextEditingController? controller,
  FormFieldSetter? onSave,
  FormFieldSetter? onChanged,
  String? Function(Object?)? validator,
  TextInputType? keyboardType,
  TextStyle? style,
  IconData? prefixIcon,
  Color? iconColor,
  String? hintText,
  List<DropdownMenuItem<Object>>? items,
  Object? selectedValue,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
    child: Container(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 224, 232, 232),
        borderRadius: BorderRadius.circular(3),
      ),
      child: DropdownButtonFormField(
        style: const TextStyle(
          fontSize: 14,
          color: Color(0XFF464646),
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.grey[150],
        ),
        items: items,
        value: selectedValue,
        validator: validator,
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        onSaved: onSave,
        onChanged: onChanged,
        dropdownColor: Colors.grey[150],
        hint: Text(
          hintText!,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}

Widget buildDropDownBtn2({
  TextEditingController? controller,
  FormFieldSetter? onSave,
  FormFieldSetter? onChanged,
  String? Function(Object?)? validator,
  TextInputType? keyboardType,
  TextStyle? style,
  IconData? prefixIcon,
  Color? iconColor,
  String? hintText,
  List<DropdownMenuItem<Object>>? items,
  Object? selectedValue,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 0.0),
    child: Container(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 224, 232, 232),
        borderRadius: BorderRadius.circular(3),
      ),
      child: DropdownButtonFormField(
        style: const TextStyle(
          fontSize: 14,
          color: Color(0XFF464646),
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.grey[0],
        ),
        items: items,
        value: selectedValue,
        validator: validator,
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        onSaved: onSave,
        onChanged: onChanged,
        dropdownColor: Colors.grey[150],
        hint: Text(
          hintText!,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}

Widget buildDropDownBtn3({
  TextEditingController? controller,
  FormFieldSetter? onSave,
  FormFieldSetter? onChanged,
  String? Function(Object?)? validator,
  TextInputType? keyboardType,
  TextStyle? style,
  IconData? prefixIcon,
  Color? iconColor,
  String? hintText,
  List<DropdownMenuItem<Object>>? items,
  Object? selectedValue,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 0.0, right: 15.0),
    child: Container(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 224, 232, 232),
        borderRadius: BorderRadius.circular(3),
      ),
      child: DropdownButtonFormField(
        style: const TextStyle(
          fontSize: 14,
          color: Color(0XFF464646),
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.grey[0],
        ),
        items: items,
        value: selectedValue,
        validator: validator,
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        onSaved: onSave,
        onChanged: onChanged,
        dropdownColor: Colors.grey[150],
        hint: Text(
          hintText!,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}

class BuildDatePickerInput extends StatefulWidget {
  const BuildDatePickerInput(
      {Key? key,
      this.controller,
      this.iconColor,
      this.keyboardType,
      this.hintText,
      this.onSave,
      this.onChanged,
      this.prefixIcon,
      this.style,
      this.validator,
      this.onPressed})
      : super(key: key);

  final TextEditingController? controller;
  final FormFieldSetter? onSave;
  final Function(String)? onChanged;
  final Function()? onPressed;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final IconData? prefixIcon;
  final Color? iconColor;
  final String? hintText;
  final String dateData = "";

  @override
  _BuildDatePickerInputState createState() => _BuildDatePickerInputState();
}

class _BuildDatePickerInputState extends State<BuildDatePickerInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(Ionicons.image, color: widget.iconColor),
            onPressed: widget.onPressed,
          ),
          hintText: widget.hintText,
          contentPadding: const EdgeInsets.all(10),
          filled: true,
          fillColor: Colors.grey[150],
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        validator: widget.validator,
        onSaved: widget.onSave,
        onChanged: widget.onChanged,
        readOnly: true,
      ),
    );
  }
}

Widget buildDatePickerInput({
  TextEditingController? controller,
  FormFieldSetter? onSave,
  FormFieldValidator<String>? validator,
  TextInputType? keyboardType,
  TextStyle? style,
  IconData? prefixIcon,
  Color? iconColor,
  String? hintText,
  String dateData = "",
  BuildContext? context,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 00, right: 10),
    child: TextFormField(
      controller: TextEditingController(text: dateData.isEmpty ? "" : dateData),
      decoration: InputDecoration(
        suffixIcon: IconButton(
            icon: Icon(Ionicons.image, color: iconColor),
            onPressed: () {
              showDatePicker(
                context: context!,
                initialDate: DateTime.now(),
                firstDate: DateTime(1890),
                lastDate: DateTime(2222),
              ).then((date) {
                dateData = date!.toString();
                print(dateData.toString());
              });
            }),
        hintText: dateData.isEmpty ? 'Date' : dateData,
        contentPadding: const EdgeInsets.all(10),
        filled: true,
        fillColor: Colors.grey[150],
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
      validator: validator,
      onSaved: onSave,
      readOnly: true,
    ),
  );
}

Widget build2TextInput({
  TextEditingController? controller,
  Function(String?)? onSave,
  Function(String?)? onChanged,
  FormFieldValidator<String>? validator,
  TextInputType? keyboardType,
  TextStyle? style,
  IconData? prefixIcon,
  Color? iconColor,
  String? hintText,
  bool readonly = false,
  EdgeInsetsGeometry? padding,
}) {
  return Padding(
    padding: padding!,
    child: TextFormField(
      controller: controller,
      onSaved: onSave,
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      textCapitalization: TextCapitalization.sentences,
      readOnly: readonly,
      style: const TextStyle(
        fontSize: 14,
        color: Color(0XFF464646),
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 12,
          color: Colors.black54,
          fontWeight: FontWeight.w500,
        ),
        contentPadding: const EdgeInsets.all(15.0),
        filled: true,
        fillColor: Colors.grey[150],
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}
