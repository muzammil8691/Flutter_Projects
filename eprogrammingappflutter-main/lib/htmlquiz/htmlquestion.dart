class Htmlquestion {
  final int? id, answer;
  final String? question;
  final List<String>? options;

  Htmlquestion({this.id, this.question, this.answer, this.options});
}

const List html_data = [
  {
    "id": 1,
    "question": "HTML stands for ______",
    "options": ["Hyper Text Markup Language", "Highly Tuned Machine Learning", "Hyperlink and Text Management Language", "Highly Typed Machine Language"],
    "answer_index": 0
  },
  {
    "id": 2,
    "question": "Which tag is used to create a hyperlink in HTML?",
    "options": ["<a>", "<link>", "<href>", "<hyper>"],
    "answer_index": 0
  },
  {
    "id": 3,
    "question": "What is the correct HTML element for the largest heading?",
    "options": ["<h1>", "<head>", "<h6>", "<heading>"],
    "answer_index": 0
  },
  {
    "id": 4,
    "question": "Which HTML attribute is used to define inline styles?",
    "options": ["class", "style", "font", "css"],
    "answer_index": 1
  },
  {
    "id": 5,
    "question": "What does HTML use to define the structure of a web page?",
    "options": ["Tags", "CSS", "JavaScript", "APIs"],
    "answer_index": 0
  },
  {
    "id": 6,
    "question": "Which tag is used to define an unordered list in HTML?",
    "options": ["<ul>", "<ol>", "<li>", "<list>"],
    "answer_index": 0
  },
  {
    "id": 7,
    "question": "What does HTML use to define the appearance of content?",
    "options": ["CSS", "JavaScript", "Tags", "Links"],
    "answer_index": 0
  },
  {
    "id": 8,
    "question": "Which tag is used to add a line break in HTML?",
    "options": ["<br>", "<break>", "<lb>", "<line>"],
    "answer_index": 0
  },
  {
    "id": 9,
    "question": "What is the correct HTML for inserting an image?",
    "options": ["<img src='image.jpg'>", "<picture src='image.jpg'>", "<image href='image.jpg'>", "<img href='image.jpg'>"],
    "answer_index": 0
  },
  {
    "id": 10,
    "question": "Which attribute is used to specify a unique name for an HTML element?",
    "options": ["id", "class", "name", "unique"],
    "answer_index": 0
  },
  {
    "id": 11,
    "question": "Which HTML element is used to define a table row?",
    "options": ["<td>", "<tr>", "<table-row>", "<th>"],
    "answer_index": 1
  },
  {
    "id": 12,
    "question": "Which tag is used for creating a horizontal line in HTML?",
    "options": ["<hr>", "<line>", "<break>", "<hl>"],
    "answer_index": 0
  },
  {
    "id": 13,
    "question": "What does the HTML <canvas> element used for?",
    "options": ["Creating images", "Styling text", "Playing audio", "Embedding videos"],
    "answer_index": 0
  },
  {
    "id": 14,
    "question": "Which attribute is used to link an external CSS file to an HTML document?",
    "options": ["<style>", "rel", "href", "type"],
    "answer_index": 2
  },
  {
    "id": 15,
    "question": "What is the correct HTML for creating a hyperlink?",
    "options": ["<a href='url'>link text</a>", "<link>url</link>", "<hyperlink>url</hyperlink>", "<a>url</a>"],
    "answer_index": 0
  },
  {
    "id": 16,
    "question": "Which tag is used to define a footer in HTML?",
    "options": ["<footer>", "<bottom>", "<end>", "<foot>"],
    "answer_index": 0
  },
  {
    "id": 17,
    "question": "In HTML, which attribute is used to specify the alternative text for an image?",
    "options": ["alt", "title", "src", "href"],
    "answer_index": 0
  },
  {
    "id": 18,
    "question": "Which HTML element is used to define the structure of an HTML document?",
    "options": ["<document>", "<head>", "<body>", "<html>"],
    "answer_index": 3
  },
  {
    "id": 19,
    "question": "Which tag is used to create an ordered list in HTML?",
    "options": ["<ul>", "<li>", "<ol>", "<list>"],
    "answer_index": 2
  },
  {
    "id": 20,
    "question": "What is the correct HTML for inserting a line break?",
    "options": ["<br>", "<break>", "<linebreak>", "<lb>"],
    "answer_index": 0
  },
  {
    "id": 21,
    "question": "Which HTML tag is used for the largest heading?",
    "options": ["<h6>", "<h1>", "<head>", "<heading>"],
    "answer_index": 1
  },
  {
    "id": 22,
    "question": "Which tag is used to define a navigation menu in HTML?",
    "options": ["<nav>", "<menu>", "<navbar>", "<navigation>"],
    "answer_index": 0
  },
  {
    "id": 23,
    "question": "In HTML, which attribute specifies the URL of the page that the link goes to?",
    "options": ["link", "url", "href", "src"],
    "answer_index": 2
  },
  {
    "id": 24,
    "question": "Which tag is used to create a hyperlink to an email address in HTML?",
    "options": ["<mail>", "<email>", "<link>", "<a>"],
    "answer_index": 3
  },
  {
    "id": 25,
    "question": "What does the HTML <aside> element represent?",
    "options": ["Content aside from the main content", "A sidebar", "An advertisement", "A footer"],
    "answer_index": 0
  },
  {
    "id": 26,
    "question": "Which tag is used for defining the body of an HTML document?",
    "options": ["<html>", "<body>", "<head>", "<content>"],
    "answer_index": 1
  },
  {
    "id": 27,
    "question": "What does the HTML <abbr> tag represent?",
    "options": ["Abbreviation or acronym", "A bold text", "A link", "An image"],
    "answer_index": 0
  },
  {
    "id": 28,
    "question": "Which attribute is used to provide an advisory text about an element or its content in HTML?",
    "options": ["title", "advisory", "info", "description"],
    "answer_index": 0
  },
  {
    "id": 29,
    "question": "Which tag is used to create a container for content in HTML?",
    "options": ["<container>", "<section>", "<wrapper>", "<div>"],
    "answer_index": 3
  },
  {
    "id": 30,
    "question": "What does the HTML <blockquote> tag represent?",
    "options": ["A block of text quoted from another source", "An inline quotation", "A footer", "A highlighted text"],
    "answer_index": 0
  }
];

