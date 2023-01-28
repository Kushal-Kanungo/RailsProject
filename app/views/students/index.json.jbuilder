# Used json.custom name to create a array with a name or a key like this { students : [ {}, {}, {} ] }

json.students @students do |student|
  json.extract! student, :name, :email, :age
  json.foo :bar if student.age < 100 # Conditional values passed
end
