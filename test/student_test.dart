import 'package:flutter_test/flutter_test.dart';
import 'package:student_management_flutter/student.dart';

void main() {
  group('Student model', () {
    test('converts JSON into a Student object', () {
      final student = Student.fromJson({
        'id': 1,
        'student_number': 'CLASS-001',
        'first_name': 'Jamie',
        'last_name': 'Santos',
        'email': 'jamie.santos@example.test',
        'course': 'Computer Science',
        'year_level': 2,
        'updated_at': '2026-11-06T20:02:54',
      });

      expect(student.id, 1);
      expect(student.name, 'Jamie Santos');
      expect(student.number, 'CLASS-001');
      expect(student.course, 'Computer Science');
      expect(student.year, 2);
      expect(student.initials, 'JS');
    });

    test('converts StudentDraft into database fields', () {
      const draft = StudentDraft(
        number: ' FLUTTER-001 ',
        firstName: ' Jamie ',
        lastName: ' Santos ',
        email: ' jamie.flutter@example.test ',
        course: ' Information Technology ',
        year: 2,
      );

      expect(draft.toJson(), {
        'student_number': 'FLUTTER-001',
        'first_name': 'Jamie',
        'last_name': 'Santos',
        'email': 'jamie.flutter@example.test',
        'course': 'Information Technology',
        'year_level': 2,
      });
    });

    test('rejects empty required fields', () {
      expect(
        StudentDraft.requiredText('', 'first name', 100),
        'Enter first name.',
      );
    });

    test('rejects invalid email addresses', () {
      expect(
        StudentDraft.emailError('invalid-email'),
        'Enter a valid email address.',
      );
    });

    test('accepts valid email addresses', () {
      expect(
        StudentDraft.emailError('jamie@example.test'),
        isNull,
      );
    });
  });
}
