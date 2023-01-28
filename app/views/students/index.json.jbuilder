# Used json.custom name to create a array with a name or a key like this { students : [ {}, {}, {} ] }

json.cache! ['v1', @students], expires_in: 10.minutes do
  json.students @students do |student|
    json.extract! student, :name, :email, :age
    json.foo :bar if student.age < 100 # Conditional values passed
  end
end
