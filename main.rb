require_relative 'model/person'
require_relative 'model/teacher'

person = Person.new(17, parent_permission: false)
p(person.can_use_services?)

teacher = Teacher.new('math',27)
p(teacher.can_use_services?)
