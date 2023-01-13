require 'rails_helper'

RSpec.describe "Doctor Show Page" do
  let!(:hospital1) {create(:hospital)}
  let!(:doctor1) {create(:doctor, hospital_id: hospital1.id)}
  let!(:doctor2) {create(:doctor, hospital_id: hospital1.id)}
  let!(:patient1) {create(:patient)}
  let!(:patient2) {create(:patient)}
  let!(:doctor_patient1) {create(:doctor_patient, doctor_id: doctor1.id, patient_id: patient1.id)}
  let!(:doctor_patient2) {create(:doctor_patient, doctor_id: doctor2.id, patient_id: patient2.id)}
  
  describe "User Story 1" do
    it "displays Doctor information" do
      visit doctor_path(doctor1)
      
      expect(page).to have_content(doctor1.name)
      expect(page).to have_content(doctor1.specialty)
      expect(page).to have_content(doctor1.university)
      expect(page).to have_content(doctor1.patients[0].name)
      expect(page).to have_content(doctor1.hospital.name)
    end
    
    it "does not display other doctor information" do
      visit doctor_path(doctor1)
      
      expect(page).to_not have_content(doctor2.name)
      expect(page).to_not have_content(doctor2.specialty)
      expect(page).to_not have_content(doctor2.university)
      expect(page).to_not have_content(doctor2.patients[0].name)
    end
  end
  
  describe "User Story 2" do
    it "remove patient from a doctor" do
      visit doctor_path(doctor1.id)
      
      expect(page).to have_content(patient1.name)
      
      within "#doctor_patient_id_#{doctor_patient1.id}" do
        expect(page).to have_button("Remove")
        
        click_button "Remove"
        expect(current_path).to eq(doctor_path(doctor1.id))
      end
      
      expect(page).to_not have_content(patient1.name)
    end
    
    it "does not remove patient from another doctor page" do
      create(:doctor_patient, doctor_id: doctor2.id, patient_id: patient1.id)
      
      visit doctor_path(doctor1.id)
      
      expect(page).to have_content(patient1.name)
      
      within "#doctor_patient_id_#{doctor_patient1.id}" do
        click_button "Remove"
      end
      expect(page).to_not have_content(patient1.name)
      
      visit doctor_path(doctor2.id)
      expect(page).to have_content(patient1.name)
    end
  end
end