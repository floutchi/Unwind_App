extension Format on DateTime {
  String dateLocale() => "$day/$month/$year";

  String dateTimeLocale() => '${dateLocale()} $hour:$minute';
}
