require "rails_helper"

RSpec.describe "When I visit the surgery index page" do
  before :each do
    @surgery1 = Surgery.create!(title: "First surgery", day_of_week: 'Monday', operating_room_number: '321')
    @surgery2 = Surgery.create!(title: "Second surgery", day_of_week: 'Tuesday', operating_room_number: '654')
    @doc1 = @surgery1.doctors.create!(name: "Scott", years_practiced: 14, university:"UCLA")
    @doc2 = @surgery1.doctors.create!(name: "Mike", years_practiced: 8, university:"Chicago College")
    @doc3 = @surgery1.doctors.create!(name: "Jason", years_practiced: 11, university:"Boston College")
    @doc4 = Doctor.create!(name: "Sector Keeper", years_practiced: 30, university:"Ghost School")
    @surgery2.doctors << @doc4
    @surgery2.doctors << @doc3

  end

  it "shows the attributes of all surgeries" do
    visit surgery_index_path

    expect(page).to have_content(@surgery1.title)
    expect(page).to have_content(@surgery1.day_of_week)
    expect(page).to have_content(@surgery1.operating_room_number)
    expect(page).to have_content(@surgery2.title)
    expect(page).to have_content(@surgery2.day_of_week)
    expect(page).to have_content(@surgery2.operating_room_number)
  end

  it "shows average years experience for doctors on the surgery" do
    visit surgery_index_path

    expect(page).to have_content(@surgery1.average_years)
    expect(page).to have_content(@surgery2.average_years)
  end
end
