extension StringUtils on String {
  /// Convierte un String para el TitleCase
  /// Ejemplo: "rafael" -> "Rafael"
  String toTitleCase() {
    if (isEmpty) {
      return this;
    }

    List<String> words = split(' ');

    List<String> capitalizedWords = words.map((word) {
      if (word.isEmpty) {
        return word;
      }
      String firstLetter = word[0].toUpperCase();
      String remainingLetters = word.substring(1).toLowerCase();
      return firstLetter + remainingLetters;
    }).toList();

    return capitalizedWords.join(' ');
  }
}
