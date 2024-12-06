class InputValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu email.';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Por favor, insira um email válido.';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira sua senha.';
    }
    if (value.length < 6) {
      return 'A senha deve ter pelo menos 6 caracteres.';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu nome.';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Por favor, confirme sua senha.';
    }
    if (value != password) {
      return 'As senhas não coincidem.';
    }
    return null;
  }
}
