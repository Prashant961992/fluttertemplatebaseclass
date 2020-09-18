class Validator {
  String validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String validateMobile(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (value.length != 10) {
      return "Mobile number must 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  String validatePassword(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0 || value == "") {
      return "Password is required";
    }
   else if (value.length < 6){
     return "Password must be longer than 6 characters";
   }
   else if(!regExp.hasMatch(value)){
     return "Password must have 1 UPPER CASE, 1 LOWER CASE , 1 NUMERIC & 1 SPECIAL CHARACTER (! @ # \$ & * ~)";
   }
    return null;
  }

  String validateEmail(String value) {
    String pattern = r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$';
       // r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0 || value == "") {
      return "Email is required";
    } else if (!regExp.hasMatch(value)) {
      return "Please enter valid email";
    } else {
      return null;
    }
  }
}