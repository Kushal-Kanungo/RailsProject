# *  Nesting
json.student do |json|
  json.extract! @student, :name, :email, :age
end
# It is nested to `student`
# {
#   "student":{
#     "name" : "Kushal",
#     "email": "kushal@gmail.com",
#     "age", : 23
#   }
# }

# Guess to output
json.nest1 do |json|
  json.nest2 do |json|
    json.nest3 do |json|
      json.nest4 do |json|
        json.extract! @student, :name, :email, :age
      end
    end
  end
end
