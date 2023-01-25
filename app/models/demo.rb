class Demo < ApplicationRecord
  # validates :demo_name, presence: true
  # validates :desc, presence: true
  has_one :sub_demo
end
