import '../index.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  // final String label;
  // final TextStyle labelStyle;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final bool isShowSuffixIcon;
  final Icon suffixIcon;
  final bool autoValidate;
  final TextEditingController controller;
  final int maxLines = 1;
  final FormFieldValidator<String> validator;
  final Function(String) onFieldSubmitted;

//  double contentPadding = 8.0;
//  double borderWidth = 1.0;
//  MaterialColor enabledBorderColor = Colors.grey;
//  MaterialColor focusedBorderColor = Colors.blue;
//  double borderRadius = 8.0;

  CustomTextFormField(
      {
        this.hintText,
      // this.label,
      // this.labelStyle,
      this.keyboardType,
      this.obscureText = false,
      this.isShowSuffixIcon = false,
      this.autoValidate = false,
      this.textInputAction = TextInputAction.done,
      this.onFieldSubmitted,
      this.validator,
      this.suffixIcon,
      this.controller});

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      cursorColor: primarythemeColor,
      maxLines: widget.maxLines,
      textInputAction: widget.textInputAction,
      autofocus: false,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      controller: widget.controller,
      validator: widget.validator,
      autovalidate: widget.autoValidate,
      enabled: true,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: widget.hintText,
        // labelText: widget.label,
        // labelStyle: widget.labelStyle,
//        contentPadding: EdgeInsets.all(widget.contentPadding),suffixIcon Icon(Icons.arrow_drop_down)
        suffixIcon: widget.isShowSuffixIcon == true ? widget.suffixIcon : null,
//        enabledBorder: OutlineInputBorder(
//            borderSide: BorderSide(
//                width: widget.borderWidth, color: widget.enabledBorderColor),
//            borderRadius:
//                BorderRadius.all(Radius.circular(widget.borderRadius))),
//        focusedBorder: OutlineInputBorder(
//            borderSide: BorderSide(
//                width: widget.borderWidth, color: widget.focusedBorderColor),
//            borderRadius:
//                BorderRadius.all(Radius.circular(widget.borderRadius))),
      ),
    );
  }
}

// class CustomTextFormField extends StatefulWidget {
//   final String hintText;
//   final String label;
//   final TextInputType keyboardType;
//   bool obscureText;
//   bool autoValidate;
//   final bool showPasswordToggleIcon;
//   final TextEditingController controller;
//   final int maxLines = 1;
//   final double contentPadding = 8.0;
//   final double borderWidth = 1.0;
//   final double borderRadius = 8.0;
//   final String Function(String) validator;

//   CustomTextFormField(
//       {this.hintText,
//       this.label,
//       this.keyboardType,
//       this.obscureText,
//       this.showPasswordToggleIcon,
//       this.controller,
//       this.validator,
//       this.autoValidate,});

//   @override
//   _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
// }

// class _CustomTextFormFieldState extends State<CustomTextFormField> {
//   @override
//   Widget build(BuildContext context) {
//     return new TextFormField(
//       validator:  widget.validator,
//       autovalidate: widget.autoValidate ?? false,
//       maxLines: widget.maxLines,
//       autofocus: false,
//       keyboardType: widget.keyboardType ?? TextInputType.text,
//       obscureText: widget.obscureText ?? false,
//       controller: widget.controller,
//       decoration: InputDecoration(
//         hintText: widget.hintText,
//         labelText: widget.label,
//         contentPadding: EdgeInsets.all(widget.contentPadding),
//         suffixIcon: widget.showPasswordToggleIcon == true
//             ? widget.obscureText == true
//                 ? IconButton(
//                     icon: Icon(
//                       Icons.visibility_off,
//                       color: Colors.grey,
//                     ),
//                     onPressed: () {
//                       setState(() => widget.obscureText = !widget.obscureText);
//                     },
//                   )
//                 : IconButton(
//                     icon: Icon(
//                       Icons.remove_red_eye,
//                       color: Colors.blue,
//                     ),
//                     onPressed: () {
//                       setState(() => widget.obscureText = !widget.obscureText);
//                     },
//                   )
//             : null,
//         enabledBorder: OutlineInputBorder(
//             borderSide:
//                 BorderSide(width: widget.borderWidth, color: Colors.grey),
//             borderRadius:
//                 BorderRadius.all(Radius.circular(widget.borderRadius))),
//         focusedBorder: OutlineInputBorder(
//             borderSide:
//                 BorderSide(width: widget.borderWidth, color: Colors.blue),
//             borderRadius:
//                 BorderRadius.all(Radius.circular(widget.borderRadius))),
//         errorBorder: OutlineInputBorder(
//             borderSide:
//                 BorderSide(width: widget.borderWidth, color: Colors.red),
//             borderRadius:
//                 BorderRadius.all(Radius.circular(widget.borderRadius))),
//         focusedErrorBorder: OutlineInputBorder(
//             borderSide:
//                 BorderSide(width: widget.borderWidth, color: Colors.red),
//             borderRadius:
//                 BorderRadius.all(Radius.circular(widget.borderRadius))),
//       ),
//     );
//   }
// }
