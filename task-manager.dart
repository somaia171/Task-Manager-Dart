import 'dart:io';

void clearScreen() {
  print('\x1B[2J\x1B[0;0H');
}

var tasks = {};

void appInterface() {
  clearScreen();
  print("🌟 Welcome To Task Manager 🌟\n");
  print("1- Add a task");
  print("2- Display tasks");
  print("3- Edit a task");
  print("4- Remove a task");
  print("5- Remove all tasks");
  print("6- Exit");
}

void addTask() {
  clearScreen();
  stdout.write("Enter task name: ");
  String? newTask = stdin.readLineSync();
  if (newTask != "") {
    tasks[newTask] = false;
    clearScreen();
    print("Task Added! ✔️");
    stdout.write("\nPress Enter... ");
    stdin.readLineSync();
  }
}

void displayTasks() {
  clearScreen();
  if (tasks.isEmpty) {
    print("No tasks yet!");
    stdout.write("\nPress Enter... ");
    stdin.readLineSync();

  } else {
    var emoji;
    for (var entry in tasks.entries) {
      if (entry.value == true) {
        emoji = "✅";
      } else {
        emoji = "⬜️";
      }
      print("🔸 ${entry.key} $emoji\n");
    }
    stdout.write("\nPress Enter... ");
    stdin.readLineSync();
  }
}

void editTask() {
  clearScreen();
  stdout.write("Enter task name: ");
  String? taskName = stdin.readLineSync();

  if (tasks.containsKey(taskName)) {
    bool value;
    print("\n1- ✅\n");
    print("2- ⬜️");

    while (true) {
      stdout.write("\nEnter (1 or 2): ");
      String? taskValue = stdin.readLineSync();

      if (taskValue == "1") {
        value = true;
        break;

      } else if (taskValue == "2") {
        value = false;
        break;

      } else {
        print("\nInvalid Input!");
      }
    }

    tasks[taskName] = value;
    clearScreen();
    print("Task Edited! ✔️");
    stdout.write("\nPress Enter... ");
    stdin.readLineSync();

  } else {
    print("\nTask not found! ❓");
    stdout.write("\nPress Enter... ");
    stdin.readLineSync();
  }
}

void removeTask() {
  clearScreen();
  stdout.write("Enter task name: ");
  String? taskName = stdin.readLineSync();

  if (tasks.containsKey(taskName)) {
    tasks.remove(taskName);
    clearScreen();
    print("Task Removed! ✔️");
    stdout.write("\nPress Enter... ");
    stdin.readLineSync();

  } else {
    print("\nTask not found! ❓");
    stdout.write("\nPress Enter... ");
    stdin.readLineSync();
  }
}

void removeAllTasks() {
  tasks.clear();
  clearScreen();
  print("All tasks removed! ✔️");
  stdout.write("\nPress Enter... ");
  stdin.readLineSync();
}

void main() {
  while (true) {
    appInterface();
    stdout.write("\nEnter a number: ");
    String? userInput = stdin.readLineSync();

    if (userInput == "1") {
      addTask();

    } else if (userInput == "2") {
      displayTasks();

    } else if (userInput == "3") {
      editTask();

    } else if (userInput == "4") {
      removeTask();

    } else if (userInput == "5") {
      removeAllTasks();

    } else if (userInput == "6") {
      clearScreen();
      print("See you soon...\n");
      break;

    } else {
      print("\nInvalid Input!");
      stdout.write("\nPress Enter... ");
      stdin.readLineSync();
    }
  }
}
