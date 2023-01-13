require 'rails_helper'

RSpec.describe Doctor do
  it {should belong_to :hospital}

  describe "methods" do
  let!(:hospital1) {create(:hospital)}
  let!(:doctor1) {create(:doctor, hospital_id: hospital1.id)}
  let!(:doctor2) {create(:doctor, hospital_id: hospital1.id)}
  let!(:patient1) {create(:patient)}
  let!(:patient2) {create(:patient)}
  let!(:doctor_patient1) {create(:doctor_patient, doctor_id: doctor1.id, patient_id: patient1.id)}
  let!(:doctor_patient2) {create(:doctor_patient, doctor_id: doctor1.id, patient_id: patient2.id)}
  let!(:doctor_patient3) {create(:doctor_patient, doctor_id: doctor2.id, patient_id: patient1.id)}

    it "number_patients" do
      expect(doctor1.number_patients).to eq 2
      expect(doctor2.number_patients).to eq 1
    end
  end
end
