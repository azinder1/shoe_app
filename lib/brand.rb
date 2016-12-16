class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:name, :presence => true, :uniqueness => {:case_sensitive => false})
  before_save(:upcase_first_letter)

private

  def upcase_first_letter
    self.name=(name().titleize())
  end
end
