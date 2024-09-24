import 'dart:io';

// String Manipulation
void stringManipulation(String input) {
  print("Original string: $input");
  
  // Concatenation
  String concatenated = "$input World!";
  print("Concatenated: $concatenated");
  
  // Interpolation
  int number = 42;
  String interpolated = "The answer is $number";
  print("Interpolated: $interpolated");
  
  // Substring extraction
  String substring = input.substring(0, 5);
  print("Substring (first 5 chars): $substring");
  
  // Case conversion
  String upperCase = input.toUpperCase();
  String lowerCase = input.toLowerCase();
  print("Uppercase: $upperCase");
  print("Lowercase: $lowerCase");
  
  // Reverse string
  String reversed = input.split('').reversed.join('');
  print("Reversed: $reversed");
  
  // Count length
  int length = input.length;
  print("Length: $length");
}

// Collections
void demonstrateCollections() {
  // Lists
  List<String> fruits = ['Apple', 'Banana', 'Cherry'];
  print("\nList: ${fruits.join(', ')}");
  fruits.add('Durian');
  fruits.removeAt(1);
  print("After modifications: ${fruits.join(', ')}");

  // Sets
  Set<int> numbers = {1, 2, 3, 2, 4};
  print("\nSet: ${numbers.toList().join(', ')}");
  numbers.add(5);
  numbers.remove(2);
  print("After modifications: ${numbers.toList().join(', ')}");

  // Maps
  Map<String, int> ages = {'Alice': 30, 'Bob': 25, 'Charlie': 35};
  print("\nMap: $ages");
  ages['David'] = 28;
  ages.remove('Bob');
  print("After modifications: $ages");
}

// File Handling
Future<void> readFileAndWrite() async {
  try {
    // Read from file
    final fileContent = await File('input.txt').readAsString();
    print("\nRead from file:\n$fileContent");

    // Write to file
    await File('output.txt').writeAsString(fileContent + "\nProcessed on ${DateTime.now()}");
    print("Content written to output.txt");
  } catch (e) {
    print("\nError during file operation: $e");
  }
}

// Date and Time Manipulation
void dateTimeManipulation() {
  // Current date and time
  DateTime now = DateTime.now();
  print("\nCurrent date and time: $now");

  // Manual formatting (without intl package)
  String formattedDate = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} "
                         "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
  print("Formatted date: $formattedDate");

  // Parsing
  DateTime parsedDate = DateTime.parse('2023-01-01 12:00:00');
  print("Parsed date: $parsedDate");

  // Adding days
  DateTime futureDate = now.add(Duration(days: 7));
  print("Date after 7 days: $futureDate");

  // Calculating difference
  Duration difference = futureDate.difference(now);
  print("Difference in days: ${difference.inDays}");
}

void main() {
  print("String Manipulation:");
  stringManipulation("Hello");

  print("\nCollections Demonstration:");
  demonstrateCollections();

  print("\nFile Operations:");
  readFileAndWrite().then((_) {
    print("\nDate and Time Manipulation:");
    dateTimeManipulation();
    
    // User Input Application
    print("\nEnter some text:");
    String userInput = stdin.readLineSync() ?? '';

    List<String> processedStrings = [
      userInput,
      userInput.toUpperCase(),
      userInput.toLowerCase(),
      userInput.split('').reversed.join('')
    ];

    print("\nProcessed Strings:");
    for (var i = 0; i < processedStrings.length; i++) {
      print("${i+1}. ${processedStrings[i]}");
    }

    // Save to file
    File('log.txt')
        .writeAsStringSync(
            "${DateTime.now()}: Processed strings\n${processedStrings.join('\n')}\n",
            mode: FileMode.append);

    print("\nResults saved to log.txt");
  });
}
