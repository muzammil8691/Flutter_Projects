class Question {
  final int? id, answer;
  final String? question;
  final List<String>? options;

  Question({this.id, this.question, this.answer, this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question": "Flutter is an open-source UI software development kit created by ______",
    "options": ["Apple", "Google", "Facebook", "Microsoft"],
    "answer_index": 1
  },
  {
    "id": 2,
    "question": "Which programming language is primarily used for Flutter app development?",
    "options": ["Java", "Dart", "Swift", "Kotlin"],
    "answer_index": 1
  },
  {
    "id": 3,
    "question": "What is the purpose of the 'pubspec.yaml' file in a Flutter project?",
    "options": [
      "To define the project's dependencies and metadata",
      "To specify the app's user interface",
      "To write the app's main logic",
      "To create platform-specific code"
    ],
    "answer_index": 0
  },
  {
    "id": 4,
    "question": "Which widget in Flutter is used for building the UI layout?",
    "options": ["Scaffold", "Container", "Column", "Text"],
    "answer_index": 2
  },
  {
    "id": 5,
    "question": "What does 'StatelessWidget' represent in Flutter?",
    "options": [
      "A widget that can be updated and redrawn",
      "A widget that maintains state",
      "A widget that cannot be updated after creation",
      "A widget for handling user input"
    ],
    "answer_index": 2
  },
  {
    "id": 6,
    "question": "Which command is used to create a new Flutter project from the command line?",
    "options": ["flutter init", "flutter new", "flutter create", "flutter start"],
    "answer_index": 2
  },
  {
    "id": 7,
    "question": "What is 'Hot Reload' in Flutter?",
    "options": [
      "A feature for testing apps on multiple devices simultaneously",
      "A tool for debugging code in Flutter",
      "A technique for reloading the app instantly with code changes",
      "A method for optimizing app performance"
    ],
    "answer_index": 2
  },
  {
    "id": 8,
    "question": "Which widget is used to create a material design button in Flutter?",
    "options": ["FlatButton", "RaisedButton", "IconButton", "GestureDetector"],
    "answer_index": 1
  },
  {
    "id": 9,
    "question": "What is the purpose of the 'setState()' method in Flutter?",
    "options": [
      "To change the state of a Stateful widget",
      "To define the app's initial state",
      "To handle asynchronous operations",
      "To declare a new screen in the app"
    ],
    "answer_index": 0
  },
  {
    "id": 10,
    "question": "What does the 'async' keyword indicate in Dart?",
    "options": [
      "It represents an asynchronous function in Dart",
      "It defines a method as a constructor",
      "It specifies a static variable",
      "It marks a function as deprecated"
    ],
    "answer_index": 0
  },
  {
    "id": 11,
    "question": "Which layout widget is used to arrange its children in a row?",
    "options": ["Stack", "GridView", "Column", "Row"],
    "answer_index": 3
  },
  {
    "id": 12,
    "question": "What is the purpose of the 'main.dart' file in a Flutter project?",
    "options": [
      "To define the app's theme colors",
      "To create platform-specific code",
      "To specify the app's entry point",
      "To declare global variables"
    ],
    "answer_index": 2
  },
  {
    "id": 13,
    "question": "Which widget is used to navigate between different screens in a Flutter app?",
    "options": ["Navigator", "Router", "Transition", "Route"],
    "answer_index": 0
  },
  {
    "id": 14,
    "question": "What is the purpose of the 'MaterialApp' widget in Flutter?",
    "options": [
      "To define the app's color palette",
      "To create material design widgets",
      "To specify the app's navigation structure",
      "To configure the app's overall theme"
    ],
    "answer_index": 3
  },
  {
    "id": 15,
    "question": "Which command is used to run a Flutter app on an Android emulator?",
    "options": ["flutter build", "flutter start", "flutter install", "flutter run"],
    "answer_index": 3
  },
  {
    "id": 16,
    "question": "What does the 'main()' function represent in a Flutter app?",
    "options": [
      "It initializes the app's state",
      "It contains the main logic of the app",
      "It defines the app's initial route",
      "It handles user interactions"
    ],
    "answer_index": 1
  },
  {
    "id": 17,
    "question": "Which widget is used to display a list of items in a scrollable manner in Flutter?",
    "options": ["ListView", "ScrollView", "ListTile", "Card"],
    "answer_index": 0
  },
  {
    "id": 18,
    "question": "What is the purpose of the 'BuildContext' parameter in Flutter?",
    "options": [
      "To handle HTTP requests",
      "To define the app's context",
      "To access the app's state",
      "To manage animations"
    ],
    "answer_index": 1
  },
];

