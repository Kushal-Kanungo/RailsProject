class Article < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true, length: { minimum: 10 }
  validate :validate_god

  def validate_god
    return unless title == 'Evil'

    errors.add(:title, 'is evil')
  end

  def god?
    title == 'God'
  end
end
