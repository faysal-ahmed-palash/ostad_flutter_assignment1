abstract class Role {
  void displayRole();
}

class Person implements Role {
  final String name;
  final int age;
  final String address;

  Person(this.name, this.age, this.address);

  @override
  void displayRole() {
    print("Role: Undefined");
  }

  String get personInfo => 'Name: $name\nAge: $age\nAddress: $address';
}

class Student extends Person {
  final String studentID;
  final String grade;
  final List<double> courseScores;

  Student(String name, int age, String address, this.studentID, this.grade,
      this.courseScores)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Student");
  }

  double calculateAverageScore() {
    return courseScores.reduce((a, b) => a + b) / courseScores.length;
  }

  String get studentInfo =>
      '${super.personInfo}\nAverage Score: ${calculateAverageScore().toStringAsFixed(2)}';
}

class Teacher extends Person {
  final String teacherID;
  final List<String> coursesTaught;

  Teacher(
      String name, int age, String address, this.teacherID, this.coursesTaught)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  String get teacherInfo {
    final courses = coursesTaught.map((course) => '- $course').join('\n');
    return '${super.personInfo}\nCourses Taught:\n$courses';
  }
}

void main() {
  Student student = Student(
    "John Doe",
    20,
    "123 Main St",
    "S123",
    "A",
    [90, 85, 82],
  );

  Teacher teacher = Teacher(
    "Mrs. Smith",
    35,
    "456 Oak St",
    "T456",
    ["Math", "English", "Bangla"],
  );

  print("Student Information:\n");
  student.displayRole();
  print(student.studentInfo);

  print("\n");

  print("Teacher Information:\n");
  teacher.displayRole();
  print(teacher.teacherInfo);
}
