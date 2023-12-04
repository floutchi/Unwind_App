String? checkEmpty(String? input) {
  input ??= "";

  if (input.trim().isEmpty) return "Veuillez remplir ce champs";

  return null;
}

String? checkEmail(String? input) {
  input ??= "";

  if (input.trim().isEmpty) {
    return "Veuillez spécifier une adresse e-mail";
  }

  final exp = RegExp(
      r"""(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])""");

  if (!exp.hasMatch(input)) {
    return "Le format de l'adresse e-mail n'est pas valide";
  }

  return null;
}

String? checkPassword(String? input) {
  input ??= "";

  if (input.trim().isEmpty) {
    return "Veuillez spécifier un mot de passe";
  }

  return null;
}

String? checkNumber(String? input) {
  final empty = checkEmpty(input);

  if (empty != null) return empty;

  final exp = RegExp(r"^\d+$");

  if (!exp.hasMatch(input!)) {
    return "Veuillez spécifier un chiffre";
  }

  return null;
}
