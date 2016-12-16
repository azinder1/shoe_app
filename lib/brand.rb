class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates :name, presence: true
  before_save(:upcase_first_letter)

private

  def upcase_first_letter
    self.name=(self.name().capitalize())
  end
end
