class Answer {
  String answerText;
  bool isCorrect;

  Answer({
    required this.answerText,
    required this.isCorrect,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      answerText: json['answerText'],
      isCorrect: json['isCorrect'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answerText': answerText,
      'isCorrect': isCorrect,
    };
  }
}

class Question {
  String questionText;
  List<Answer> answers;

  Question({
    required this.questionText,
    required this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      questionText: json['questionText'],
      answers: List<Answer>.from(
        (json['answers'] as List).map(
          (answer) => Answer.fromJson(answer),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'questionText': questionText,
      'answers': answers.map((answer) => answer.toJson()).toList(),
    };
  }
}

class Quizz {
  String title;
  String description;
  String cover;
  String duration;
  String author;
  String type;
  String status;
  String media;
  List<Question> questions;

  Quizz({
    required this.title,
    required this.description,
    required this.cover,
    required this.duration,
    required this.author,
    required this.type,
    required this.status,
    required this.media,
    required this.questions,
  });

  factory Quizz.fromJson(Map<String, dynamic> json) {
    return Quizz(
      title: json['title'],
      description: json['description'],
      cover: json['cover'],
      duration: json['duration'],
      author: json['author'],
      type: json['type'],
      status: json['status'],
      media: json['media'],
      questions: List<Question>.from(
        (json['questions'] as List).map(
          (question) => Question.fromJson(question),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'cover': cover,
      'duration': duration,
      'author': author,
      'type': type,
      'status': status,
      'media': media,
      'questions': questions.map((question) => question.toJson()).toList(),
    };
  }
}
