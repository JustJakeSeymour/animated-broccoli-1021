class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients

  def number_patients
    self.patients.count
  end

  # def self.order_by_patients
  # end
end
