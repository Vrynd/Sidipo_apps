  class AuthValidate {
    static String? validateFullName(String? value) {
      if (value == null || value.trim().isEmpty) {
        return "Nama lengkap tidak boleh kosong";
      } else if (value.trim().length < 3) {
        return "Nama lengkap minimal 3 huruf";
      }
      return null;
    }

    static String? validateEmail(String? value) {
      if (value == null || value.trim().isEmpty) {
        return "Email atau Username tidak boleh kosong";
      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
        return "Format email tidak valid";
      }

      return null;
    }

    static String? validatePassword(String? value) {
      if (value == null || value.trim().isEmpty) {
        return "Password tidak boleh kosong";
      } else if (value.trim().length < 8) {
        return "Password minimal 8 karakter";
      }
      return null;
    }
  }
