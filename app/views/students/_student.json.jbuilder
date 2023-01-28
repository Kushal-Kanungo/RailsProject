json.student do |json|
  json.extract! @student, :name, :email, :age
  json.this_is :partial
end
