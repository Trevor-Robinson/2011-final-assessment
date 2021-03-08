require "rails_helper"

RSpec.describe "When I visit a surgery show page" do
  before :each do
    @surgery1 = Surgery.create!(title: "First surgery", day_of_week: 'Monday', operating_room_number: '321')
    @doc1 = @surgery1.doctors.create!(name: "Scott", years_practiced: 14, university:"UCLA")
    @doc2 = @surgery1.doctors.create!(name: "Mike", years_practiced: 8, university:"Chicago College")
    @doc3 = @surgery1.doctors.create!(name: "Jason", years_practiced: 11, university:"Boston College")
    @doc4 = Doctor.create!(name: "Sector Keeper", years_practiced: 30, university:"Ghost School")

  end

  it "shows the surgeries attributes" do
    visit surgery_path(@surgery1)

    expect(page).to have_content(@surgery1.title)
    expect(page).to have_content(@surgery1.day_of_week)
    expect(page).to have_content(@surgery1.operating_room_number)
  end

  it "shows names and years years_practiced of all doctors assigned" do
    visit surgery_path(@surgery1)
    save_and_open_page
    expect(page).to have_content(@doc1.name)
    expect(page).to have_content(@doc2.name)
    expect(page).to have_content(@doc3.name)
    expect(page).to have_content(@doc1.years_practiced)
    expect(page).to have_content(@doc2.years_practiced)
    expect(page).to have_content(@doc3.years_practiced)
    expect(page).to_not have_content(@doc4.name)
    expect(page).to_not have_content(@doc4.years_practiced)
  end

  it "shows most and least experienced doctors assigned" do
    visit surgery_path(@surgery1)

    within(".most_experienced") do
      expect(page).to have_content(@doc1.name)
      expect(page).to have_content(@doc1.years_practiced)
    end
    within(".least_experienced") do
      expect(page).to have_content(@doc2.name)
      expect(page).to have_content(@doc2.years_practiced)
    end
  end
end
