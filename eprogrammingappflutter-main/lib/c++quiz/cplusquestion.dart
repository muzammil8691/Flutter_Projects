class Cplusquestion {
  final int? id, answer;
  final String? question;
  final List<String>? options;

  Cplusquestion({this.id, this.question, this.answer, this.options});
}

const List C_data = [
  {
    "id": 1,
    "question": "What does OOP stand for in C++?",
    "options": ["Object-Oriented Programming", "Object-Oriented Protocol", "Object-Oriented Process", "Optimized Object Programming"],
    "answer_index": 0
  },
  {
    "id": 2,
    "question": "What is the syntax to define a class in C++?",
    "options": ["class MyClass { /* ... */ };", "def MyClass: /* ... */ end", "MyClass() { /* ... */ }", "Class MyClass - {}"],
    "answer_index": 0
  },
  {
    "id": 3,
    "question": "Which keyword is used to allocate memory in C++?",
    "options": ["new", "malloc", "alloc", "allocate"],
    "answer_index": 0
  },
  {
    "id": 4,
    "question": "What is the operator used for dereferencing in C++?",
    "options": ["*", "&", "->", "%"],
    "answer_index": 2
  },
  {
    "id": 5,
    "question": "Which C++ keyword is used to define a constructor?",
    "options": ["init", "constructor", "construct", "None of the above"],
    "answer_index": 3
  },
  {
    "id": 6,
    "question": "What is the purpose of the 'break' statement in C++?",
    "options": ["Terminate the loop", "Skip the current iteration", "Exit the program", "None of the above"],
    "answer_index": 0
  },
  {
    "id": 7,
    "question": "What is the use of 'static' keyword in C++?",
    "options": ["To make a variable global", "To access a variable from another class", "To declare a variable as constant", "To define a variable with static storage duration"],
    "answer_index": 3
  },
  {
    "id": 8,
    "question": "Which C++ feature allows a function to call itself?",
    "options": ["Looping", "Recursion", "Callback", "Closure"],
    "answer_index": 1
  },
  {
    "id": 9,
    "question": "What does the 'endl' manipulator do in C++?",
    "options": ["Ends the program", "Ends the line and flushes the buffer", "Ends the loop", "Ends the variable"],
    "answer_index": 1
  },
  {
    "id": 10,
    "question": "What is the output of 'sizeof(int)' in C++?",
    "options": ["Depends on the compiler", "2 bytes", "4 bytes", "8 bytes"],
    "answer_index": 2
  },
  {
    "id": 11,
    "question": "What is a pointer in C++?",
    "options": ["A variable that holds the address of another variable", "A type of loop", "A reference to a class", "A type of function"],
    "answer_index": 0
  },
  {
    "id": 12,
    "question": "What does 'nullptr' represent in C++?",
    "options": ["A pointer to a null value", "An undefined value", "A null character", "A boolean value"],
    "answer_index": 0
  },
  {
    "id": 13,
    "question": "What is the C++ operator used for logical 'OR'?",
    "options": ["&&", "||", "&", "|"],
    "answer_index": 1
  },
  {
    "id": 14,
    "question": "What does 'cin' represent in C++?",
    "options": ["Character input", "Conditional input", "Command input", "Console input"],
    "answer_index": 3
  },
  {
    "id": 15,
    "question": "What is the purpose of 'try', 'catch', 'throw' in C++?",
    "options": ["To handle exceptions", "To skip loops", "To terminate the program", "To define global variables"],
    "answer_index": 0
  },
  {
    "id": 16,
    "question": "What does 'this' represent in C++?",
    "options": ["Current class object pointer", "Current function pointer", "Current variable pointer", "Current instance of a class"],
    "answer_index": 0
  },
  {
    "id": 17,
    "question": "What is a constructor with no parameters called in C++?",
    "options": ["Default constructor", "Zero constructor", "Empty constructor", "Void constructor"],
    "answer_index": 0
  },
  {
    "id": 18,
    "question": "What is the purpose of 'delete' in C++?",
    "options": ["To remove a file", "To delete a variable", "To free memory allocated using 'new'", "To erase data"],
    "answer_index": 2
  },
  {
    "id": 19,
    "question": "What is the 'friend' keyword used for in C++?",
    "options": ["To declare a friend function or class", "To include a library", "To define a static variable", "To define a constant"],
    "answer_index": 0
  },
  {
    "id": 20,
    "question": "Which loop in C++ is guaranteed to execute at least once?",
    "options": ["for loop", "while loop", "do-while loop", "if statement"],
    "answer_index": 2
  },
  {
    "id": 21,
    "question": "What is the purpose of 'namespace' in C++?",
    "options": ["To define a scope", "To declare a variable", "To include a header file", "To define a constant"],
    "answer_index": 0
  },
  {
    "id": 22,
    "question": "What is the C++ operator used for a post-increment?",
    "options": ["++x", "x++", "--x", "x--"],
    "answer_index": 1
  },
  {
    "id": 23,
    "question": "What is a destructor in C++?",
    "options": ["A function that constructs objects", "A function that destructs objects", "A function that initializes objects", "A function that copies objects"],
    "answer_index": 1
  },
  {
    "id": 24,
    "question": "What does 'const' mean in C++?",
    "options": ["Constant value", "Conditional statement", "Constant pointer", "Constructor"],
    "answer_index": 0
  },
  {
    "id": 25,
    "question": "What is the purpose of 'virtual' functions in C++?",
    "options": ["To create instances", "To access global variables", "To override base class methods", "To define a constructor"],
    "answer_index": 2
  },
  {
    "id": 26,
    "question": "What is the C++ header file for input and output?",
    "options": ["<stdio.h>", "<iostream>", "<iostream.h>", "<inputoutput.h>"],
    "answer_index": 1
  },
  {
    "id": 27,
    "question": "Which type of inheritance is not supported in C++?",
    "options": ["Single inheritance", "Multiple inheritance", "Hierarchical inheritance", "Hybrid inheritance"],
    "answer_index": 3
  },
  {
    "id": 28,
    "question": "What does 'static' member mean in C++?",
    "options": ["Shared across all instances of a class", "Immutable member", "Local to a function", "Dynamically allocated member"],
    "answer_index": 0
  },
  {
    "id": 29,
    "question": "What is the C++ operator used to access the member of a structure using a pointer?",
    "options": ["->", ".", "*", "&"],
    "answer_index": 0
  },
  {
    "id": 30,
    "question": "What is the 'auto' keyword used for in C++?",
    "options": ["Automatic memory allocation", "Automatic type deduction", "Automatic function invocation", "Automatic looping"],
    "answer_index": 1
  }
];

