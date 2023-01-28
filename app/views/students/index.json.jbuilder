# Used json.custom name to create a array with a name or a key like this { students : [ {}, {}, {} ] }

#
# json.students @students do |student|
#   json.extract! student, :name, :email, :age
# end
#

# Shorter syntax for array
json.students @students, :name, :email, :age
