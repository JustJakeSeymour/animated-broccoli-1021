require 'rails_helper'

RSpec.describe "Doctor Show Page" do
  let!(:hospital1) {create(:hospital)}
  let!(:doctor1) {create(:doctor, hospital_id: hospital1.id)}
  let!(:patient1) {create(:patient)}
  let!(:doctor_patient1) {create(:doctor_patient, doctor_id: doctor1.id, patient_id: patient1.id)}

  describe "User Story 1" do
    it "displays Doctor information" do
      visit doctor_path(doctor1)

      expect(page).to have_content(doctor1.name)
      expect(page).to have_content(doctor1.specialty)
      expect(page).to have_content(doctor1.university)
      expect(page).to have_content(doctor1.patients[0].name)
      expect(page).to have_content(doctor1.hospital.name)
    end
  end
end