# Used json.custom name to create a array with a name or a key like this { students : [ {}, {}, {} ] }
json.students @students do |student|
  # ? Instead of this we can extract
  # json.name student.name
  # json.email student.email
  # json.age student.age

  json.extract! student, :name, :email, :age
end
