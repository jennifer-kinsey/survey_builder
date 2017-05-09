class Survey < ActiveRecord::Base
  has_many(:questions)
  has_many(:answers)
  before_save(:capitalize_name)
  validates(:name, {presence: true, length: {maximum: 50}})

private
  def capitalize_name
    self.name=(name.split(/(\W)/).map(&:capitalize).join)
  end
end
