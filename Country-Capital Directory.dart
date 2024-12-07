import 'dart:io';

void main() {
  // Map to store countries and their capitals
  Map<String, String> countryCapitalMap = {};

  // Main program loop
  while (true) {
    print('\nCountry-Capital Directory');
    print('1. Add or Update a Country’s Capital');
    print('2. View All Countries and Capitals');
    print('3. Retrieve the Capital of a Country');
    print('4. Exit');
    stdout.write('Choose an option (1-4): ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        addOrUpdateCapital(countryCapitalMap);
        break;
      case '2':
        viewAllCountries(countryCapitalMap);
        break;
      case '3':
        retrieveCapital(countryCapitalMap);
        break;
      case '4':
        print('Exiting the program. Thank you Good Bye!!!!!!');
        return; // Exit the program
      default:
        print('Invalid choice. Please select a valid option.');
    }
  }
}

// Function to add or update a country's capital
void addOrUpdateCapital(Map<String, String> map) {
  stdout.write('Enter the country name: ');
  String? country = stdin.readLineSync();
  stdout.write('Enter the capital of $country: ');
  String? capital = stdin.readLineSync();

  if (country != null && capital != null) {
    map[country] = capital;
    print('The capital of $country has been set to $capital.');
  } else {
    print('Invalid input. Please try again.');
  }
}

// Function to view all countries and capitals
void viewAllCountries(Map<String, String> map) {
  if (map.isEmpty) {
    print('No countries in the directory yet.');
  } else {
    print('\nList of Countries and Capitals:');
    map.forEach((country, capital) {
      print('$country: $capital');
    });
  }
}

// Function to retrieve the capital of a specific country
void retrieveCapital(Map<String, String> map) {
  stdout.write('Enter the country name: ');
  String? country = stdin.readLineSync();

  if (country != null) {
    String? capital = getCapital(map, country);
    if (capital != null) {
      print('The capital of $country is $capital.');
    } else {
      print('No capital found for $country.');
    }
  } else {
    print('Invalid input. Please try again.');
  }
}

// Function to get a capital, returns null if the country doesn’t exist
String? getCapital(Map<String, String> map, String country) {
  return map[country];
}
