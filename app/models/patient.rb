class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients
  
  validates_presence_of :name
  validates_presence_of :age

  def self.all_adults
    self.where('age > ?', 18)
  end

  def self.all_adults_alphabetical
    self.all_adults.order(:name)
  end
end
