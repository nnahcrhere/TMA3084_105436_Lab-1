import 'dart:io';

void main() {
  print("=== Pizza Order Calculator ===");
  print("Pizza Prices:");
  print("1. Small  - \$5");
  print("2. Medium - \$7");
  print("3. Large  - \$10\n");

  bool isOrdering = true;

  while (isOrdering) {
    stdout.write("Choose pizza size (Small/Medium/Large) or type 'exit' to quit: ");
    String? inputSize = stdin.readLineSync()?.trim().toLowerCase();

    if (inputSize == 'exit') {
      print("Thank you for using Pizza Order Calculator!");
      isOrdering = false;
      break;
    }

    int pricePerPizza = 0;

    switch (inputSize) {
      case 'small':
        pricePerPizza = 5;
        break;
      case 'medium':
        pricePerPizza = 7;
        break;
      case 'large':
        pricePerPizza = 10;
        break;
      default:
        print("Invalid size! Please choose Small, Medium, or Large.\n");
        continue;
    }

    stdout.write("Enter quantity: ");
    String? inputQuantity = stdin.readLineSync();
    int? quantity = int.tryParse(inputQuantity ?? '');

    if (quantity == null || quantity <= 0) {
      print("Invalid quantity! Please enter a positive integer.\n");
      continue;
    }

    int totalPayment = pricePerPizza * quantity;
    print("-----------------------------------");
    print("Total Payment: \$$totalPayment USD");
    print("-----------------------------------\n");

    stdout.write("Would you like to place another order? (y/n): ");
    String? choice = stdin.readLineSync()?.trim().toLowerCase();
    if (choice != 'y') {
      print("Thank you for your order!");
      isOrdering = false;
    }
    print("");
  }
}