class Javaquestion {
  final int? id, answer;
  final String? question;
  final List<String>? options;

  Javaquestion({this.id, this.question, this.answer, this.options});
}

const List java_data = [
  {
    "id": 1,
    "question": "Java programming language was originally developed by ______.",
    "options": ["Sun Microsystems", "IBM", "Microsoft", "Oracle"],
    "answer_index": 0
  },
  {
    "id": 2,
    "question": "Which of the following is a feature of Java?",
    "options": ["Automatic memory management", "Manual memory allocation", "Pointers", "Multiple inheritance"],
    "answer_index": 0
  },
  {
    "id": 3,
    "question": "Which keyword is used to define a constant in Java?",
    "options": ["final", "static", "const", "constant"],
    "answer_index": 0
  },
  {
    "id": 4,
    "question": "Which Java keyword is used to create a subclass?",
    "options": ["this", "extends", "super", "implements"],
    "answer_index": 1
  },
  {
    "id": 5,
    "question": "In Java, which access specifier is the most restrictive?",
    "options": ["default", "protected", "public", "private"],
    "answer_index": 3
  },
  {
    "id": 6,
    "question": "What does JVM stand for in the context of Java?",
    "options": ["Java Virtual Machine", "Java Variable Method", "Just Validating Methods", "Joint Version Model"],
    "answer_index": 0
  },
  {
    "id": 7,
    "question": "Which method is called when an object is destroyed in Java?",
    "options": ["finalize()", "dispose()", "delete()", "destroy()"],
    "answer_index": 0
  },
  {
    "id": 8,
    "question": "What is the output of 10 + 20 + '30' in Java?",
    "options": ["6030", "60", "3030", "50"],
    "answer_index": 2
  },
  {
    "id": 9,
    "question": "Which of the following is not a valid data type in Java?",
    "options": ["int", "float", "byte", "string"],
    "answer_index": 3
  },
  {
    "id": 10,
    "question": "Which loop is known as an entry controlled loop in Java?",
    "options": ["do-while", "while", "for", "switch"],
    "answer_index": 1
  },
  {
    "id": 11,
    "question": "What does JDK stand for in Java?",
    "options": ["Java Development Kernel", "Just Develop Knowledge", "Java Development Kit", "Joint Development Kernel"],
    "answer_index": 2
  },
  {
    "id": 12,
    "question": "In Java, which keyword is used to implement multiple interfaces?",
    "options": ["extend", "implements", "interface", "inherit"],
    "answer_index": 1
  },
  {
    "id": 13,
    "question": "Which operator is used to allocate memory to an object in Java?",
    "options": ["new", "alloc", "malloc", "create"],
    "answer_index": 0
  },
  {
    "id": 14,
    "question": "What does the 'super' keyword refer to in Java?",
    "options": ["It refers to the superclass instance", "It refers to the current class instance", "It refers to the derived class instance", "It refers to the parent class instance"],
    "answer_index": 0
  },
  {
    "id": 15,
    "question": "Which method is called to start the execution of a thread in Java?",
    "options": ["begin()", "run()", "start()", "execute()"],
    "answer_index": 2
  },
  {
    "id": 16,
    "question": "What is the default value of an instance variable in Java?",
    "options": ["null", "0", "undefined", "Depends on the data type"],
    "answer_index": 3
  },
  {
    "id": 17,
    "question": "What does the 'break' statement do in Java?",
    "options": ["Exits from the loop", "Skips the next iteration of the loop", "Continues to the next iteration of the loop", "Throws an exception"],
    "answer_index": 0
  },
  {
    "id": 18,
    "question": "Which method is used to convert a string to uppercase in Java?",
    "options": ["toUpper()", "toUpperCase()", "convertUpper()", "upperCase()"],
    "answer_index": 1
  },
  {
    "id": 19,
    "question": "What is the main purpose of the 'finally' block in Java?",
    "options": ["To handle exceptions", "To write clean and maintainable code", "To ensure code is always executed", "To provide an alternative to 'try-catch'"],
    "answer_index": 2
  },
  {
    "id": 20,
    "question": "Which method is used to wait for a thread to finish its execution in Java?",
    "options": ["pause()", "join()", "wait()", "finish()"],
    "answer_index": 1
  },
  {
    "id": 21,
    "question": "What is the function of the 'static' keyword in Java?",
    "options": ["It defines a constant", "It creates a class instance", "It allocates memory to an object", "It declares a method or variable as belonging to the class, not to individual instances"],
    "answer_index": 3
  },
  {
    "id": 22,
    "question": "In Java, which operator is used for bitwise AND?",
    "options": ["&&", "&", "||", "|"],
    "answer_index": 1
  },
  {
    "id": 23,
    "question": "What is the purpose of the 'equals()' method in Java?",
    "options": ["To compare two objects for reference equality", "To compare two objects for value equality", "To convert a string to lowercase", "To check if an object is null"],
    "answer_index": 1
  },
  {
    "id": 24,
    "question": "What does the 'instanceof' operator do in Java?",
    "options": ["Checks if an object is of a particular type", "Checks if an object is null", "Checks if an object is empty", "Checks if an object is an array"],
    "answer_index": 0
  },
  {
    "id": 25,
    "question": "Which class is the superclass of all other classes in Java?",
    "options": ["Object", "Base", "Super", "Main"],
    "answer_index": 0
  },
  {
    "id": 26,
    "question": "What is the purpose of the 'toString()' method in Java?",
    "options": ["To convert a string to uppercase", "To concatenate two strings", "To convert an object to its string representation", "To compare two strings"],
    "answer_index": 2
  },
  {
    "id": 27,
    "question": "In Java, which statement is used to manually throw an exception?",
    "options": ["throw Exception()", "raise Exception()", "raise()", "throw"],
    "answer_index": 3
  },
  {
    "id": 28,
    "question": "What is the output of 'System.out.println(10/0)' in Java?",
    "options": ["Infinity", "0", "Error", "Compile-time error"],
    "answer_index": 2
  },
  {
    "id": 29,
    "question": "Which method is called when an object is about to be garbage collected in Java?",
    "options": ["finalize()", "dispose()", "delete()", "clean()"],
    "answer_index": 0
  },
  {
    "id": 30,
    "question": "What does the 'this' keyword refer to in Java?",
    "options": ["It refers to the superclass instance", "It refers to the current class instance", "It refers to the derived class instance", "It refers to the parent class instance"],
    "answer_index": 1
  }

];

