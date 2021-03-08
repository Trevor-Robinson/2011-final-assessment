require "rails_helper"

RSpec.describe Doctor, type: :model do
  describe "relationships" do
    it { should have_many :doctor_surgeries }
    it { should have_many(:surgeries).through(:doctor_surgeries) }
  end

  describe "class methods" do
    it "#experience_order returns all doctors by order of experience" do
      @doc1 = Doctor.create!(name: "Scott", years_practiced: 14, university:"UCLA")
      @doc2 = Doctor.create!(name: "Mike", years_practiced: 8, university:"Chicago College")
      @doc3 = Doctor.create!(name: "Jason", years_practiced: 11, university:"Boston College")

      expect(Doctor.experience_order).to eq([@doc1, @doc3, @doc2])
    end
  end
end
