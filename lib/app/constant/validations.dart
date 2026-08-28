
import '../../exports.dart';

class Validation with BaseClass {
  bool login({required String email, required String password}) {
    if (!testEmail(email)) {
      return false;
    } else if (!testPassword(password)) {
      return false;
    }
    return true;
  }

  bool signUp({String email = "", String password = "", String confirm = ""}) {
    if (!testEmail(email)) {
      return false;
    } else if (!testPassword(password)) {
      return false;
    } else if (!testConfirmPassword(password, confirm)) {
      return false;
    }
    return true;
  }

  bool detailsScreen({String name = "", String phone = "", String type = ""}) {
    if (!testName(name)) {
      return false;
    } else if (!testPhone(phone)) {
      return false;
    } else if (!testUserType(type)) {
      return false;
    }
    return true;
  }

  bool changePassword({oldPass, newPas, confirmPas}) {
    if (!testOldPass(oldPass)) {
      return false;
    } else if (!testPassword(newPas)) {
      return false;
    } else if (!testOldPass(confirmPas)) {
      return false;
    }
    return true;
  }

  bool profileValidate({required name, required userName, required email}) {
    if (!testName(name)) {
      return false;
    } else if (!testName(userName)) {
      return false;
    } else if (!testEmail(email)) {
      return false;
    }
    return true;
  }

  bool addData({
    required String category,
    required String title,
    required String description,
  }) {
    if (category == "" || category.isEmpty) {
      showMySnackBar("Please Choose Category", alert: true);
      return false;
    } else if (title.isEmpty || title == "") {
      showMySnackBar("Please Enter Title", alert: true);
      return false;
    } else if (description.isEmpty || description == "") {
      showMySnackBar("Please Enter Description", alert: true);
      return false;
    }
    return true;
  }

  //--------------------validators--------------------------------------------------------

  bool testEmail(String email) {
    if (email.isEmpty) {
      showMySnackBar("Please enter your email", alert: true);
      return false;
    } else if (!GetUtils.isEmail(email.trim())) {
      showMySnackBar("Please enter a valid email", alert: true);
      return false;
    }
    return true;
  }

  bool testUserType(String type) {
    if (type.isEmpty || type == "") {
      showMySnackBar("Please Select Sale Process", alert: true);
      return false;
    }
    return true;
  }

  bool testPhone(String phone) {
    if (phone.isEmpty) {
      showMySnackBar("Please enter your Phone", alert: true);
      return false;
    } else if (!GetUtils.isPhoneNumber(phone.trim())) {
      showMySnackBar("Please enter a valid Phone Number", alert: true);
      return false;
    }
    return true;
  }

  bool testPassword(String password) {
    if (password.isEmpty) {
      showMySnackBar("Please enter your password", alert: true);
      return false;
    } else if (password.length < 6) {
      showMySnackBar("Password must be at least 6 characters", alert: true);
      return false;
    }
    return true;
  }

  bool testConfirmPassword(String newPass, String confirm) {
    if (confirm.isEmpty) {
      showMySnackBar("Please enter confirm password", alert: true);
      return false;
    } else if (confirm.length < 6) {
      showMySnackBar("Password must be at least 6 characters", alert: true);
      return false;
    } else if (newPass != confirm) {
      showMySnackBar("Passwords do not match", alert: true);
      return false;
    }
    return true;
  }

  bool testName(String name) {
    if (name.isEmpty) {
      showMySnackBar("Please enter your Name", alert: true);
      return false;
    } else if (name.length < 4) {
      showMySnackBar("Name/UserName at least 4 character", alert: true);
      return false;
    }
    return true;
  }

  bool testOldPass(String oldPass) {
    if (oldPass.isEmpty) {
      showMySnackBar("Please enter old password", alert: true);
      return false;
    }
    return true;
  }
}
