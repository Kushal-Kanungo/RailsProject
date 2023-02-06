class Student < ApplicationRecord
    has_many :blogs 
    has_and_belongs_to_many :courses
    
end
