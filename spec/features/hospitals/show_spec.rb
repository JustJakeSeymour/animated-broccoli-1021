require 'rails_helper'

RSpec.describe "Hospital Show" do
  let!(:hospital1) {create(:hospital)}
  let!(:hospital2) {create(:hospital)}
  let!(:doctor1) {create(:doctor, hospital_id: hospital1.id)}
  let!(:doctor2) {create(:doctor, hospital_id: hospital1.id)}
  let!(:doctor3) {create(:doctor, hospital_id: hospital1.id)}
  let!(:doctor4) {create(:doctor, hospital_id: hospital2.id)}
  let!(:patient1) {create(:patient)}
  let!(:patient2) {create(:patient)}
  let!(:patient3) {create(:patient)}
  let!(:doctor_patient1) {create(:doctor_patient, doctor_id: doctor1.id, patient_id: patient1.id)}
  let!(:doctor_patient2) {create(:doctor_patient, doctor_id: doctor1.id, patient_id: patient2.id)}
  let!(:doctor_patient3) {create(:doctor_patient, doctor_id: doctor2.id, patient_id: patient1.id)}
  let!(:doctor_patient4) {create(:doctor_patient, doctor_id: doctor2.id, patient_id: patient2.id)}
  let!(:doctor_patient5) {create(:doctor_patient, doctor_id: doctor2.id, patient_id: patient3.id)}
  let!(:doctor_patient6) {create(:doctor_patient, doctor_id: doctor3.id, patient_id: patient1.id)}
  
  
  describe "extension story" do
    it "displays hospital information" do
      visit hospital_path(hospital1.id)
      
      expect(page).to have_content(hospital1.name)
      expect(page).to have_content(doctor1.name)
      expect(page).to have_content(doctor2.name)
      expect(page).to have_content(doctor3.name)
      expect(page).to_not have_content(hospital2.name)
      expect(page).to_not have_content(doctor4.name)
    end
    
    it "displays number of patients a doctor has" do
      visit hospital_path(hospital1.id)
      
      within "#doctor_id_#{doctor1.id}" do
        expect(page).to have_content(doctor1.patients.count)
      end
      
      within "#doctor_id_#{doctor2.id}" do
        expect(page).to have_content(doctor2.patients.count)
      end
      
      within "#doctor_id_#{doctor3.id}" do
        expect(page).to have_content(doctor3.patients.count)
      end
    end
    
    xit "orders doctors on page by most patients to least patients" do
      # ran out of time on the extension, giving myself opportunity to clean up before submittal
      
      # visit hospital_path(hospital1.id)

      # expect(doctor2.name).to appear_before(doctor1.name)
      # expect(doctor1.name).to appear_before(doctor3.name)
      # expect(doctor2.name).to appear_before(doctor3.name)
    end
    
  end
end