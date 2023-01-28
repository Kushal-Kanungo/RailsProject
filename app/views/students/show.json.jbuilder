# *  Nesting
json.student do |json|
  json.extract! @student, :name, :email, :age
end

myData = { rating_count: 256 }

json.merge! myData
