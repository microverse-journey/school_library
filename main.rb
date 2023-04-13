require_relative 'model/person'

person = Person.new(17,parent_permission: false)
p(person.can_use_services?)
