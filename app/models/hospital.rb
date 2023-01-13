class Hospital < ApplicationRecord
  has_many :doctors

  # def doctors_order_by_patients
  #   self.doctors.order_by_patients
  # end
end
