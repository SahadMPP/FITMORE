String cleanPhoneNumber(String phoneNumber) {
  final cleanedNumber =
      phoneNumber.replaceAll(RegExp(r'^\+\d{1,3}'), ''); // Remove country code
  return cleanedNumber.trim();
}

// Function to validate phone number
bool isValidPhoneNumber(String phoneNumber) {
  final cleanedNumber = cleanPhoneNumber(phoneNumber);
  return cleanedNumber.length >= 10; // Adjust length as needed
}

bool isValidEmail(String email) {
  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
  return emailRegex.hasMatch(email);
}
