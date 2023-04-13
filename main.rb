require_relative 'model/teacher'
require_relative 'model/student'

student = Student.new('Elementary', 17)
p(student.can_use_services?)

teacher = Teacher.new('math', 27)
p(teacher.can_use_services?)

p(student.play_hooky)
