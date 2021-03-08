require "rails_helper"

RSpec.describe Surgery, type: :model do
  describe "relationships" do
    it { should have_many :doctor_surgeries }
    it { should have_many(:doctors).through(:doctor_surgeries) }
  end

  describe "instance methods" do
    it "#average_years returns average years of all doctors on a surgery" do
      @surgery1 = Surgery.create!(title: "First surgery", day_of_week: 'Monday', operating_room_number: '321')
      @surgery2 = Surgery.create!(title: "Second surgery", day_of_week: 'Tuesday', operating_room_number: '654')
      @doc1 = @surgery1.doctors.create!(name: "Scott", years_practiced: 14, university:"UCLA")
      @doc2 = @surgery1.doctors.create!(name: "Mike", years_practiced: 8, university:"Chicago College")
      @doc3 = @surgery1.doctors.create!(name: "Jason", years_practiced: 11, university:"Boston College")
      @doc4 = Doctor.create!(name: "Sector Keeper", years_practiced: 30, university:"Ghost School")
      @surgery2.doctors << @doc4
      @surgery2.doctors << @doc3

      expect(@surgery1.average_years).to eq(11)
      expect(@surgery2.average_years).to eq(21)
    end
  end

  describe "class methods" do
    it "#average_years_order returns average years of all doctors on a surgery" do
      @surgery1 = Surgery.create!(title: "First surgery", day_of_week: 'Monday', operating_room_number: '321')
      @surgery2 = Surgery.create!(title: "Second surgery", day_of_week: 'Tuesday', operating_room_number: '654')
      @doc1 = @surgery1.doctors.create!(name: "Scott", years_practiced: 14, university:"UCLA")
      @doc2 = @surgery1.doctors.create!(name: "Mike", years_practiced: 8, university:"Chicago College")
      @doc3 = @surgery1.doctors.create!(name: "Jason", years_practiced: 11, university:"Boston College")
      @doc4 = Doctor.create!(name: "Sector Keeper", years_practiced: 30, university:"Ghost School")
      @surgery2.doctors << @doc4
      @surgery2.doctors << @doc3

      expect(Surgery.average_years_order).to eq([@surgery2, @surgery1])
    end
  end
end
