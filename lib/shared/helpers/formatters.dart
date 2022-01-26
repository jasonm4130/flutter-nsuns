// Take a space seperated string and convert it to kebab-case
String toKebabCase(String string) {
  // Convert the string to all lowercase
  String lowercase = string.toLowerCase();

  // Split the string into an array of words
  List<String> words = lowercase.split(' ');

  // Create a new string to hold the kebab-cased string
  String kebabCase = '';

  // Loop through each word in the array
  for (String word in words) {
    // Add the word to the kebab-case string
    kebabCase += word + '-';
  }

  // Remove the trailing '-'
  kebabCase = kebabCase.substring(0, kebabCase.length - 1);

  // Return the kebab-case string
  return kebabCase;
}
