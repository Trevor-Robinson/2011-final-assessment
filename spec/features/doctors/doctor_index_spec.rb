require "rails_helper"

RSpec.describe "When I visit the doctor index page" do
  before :each do
    @doc1 = Doctor.create!(name: "Scott", years_practiced: 14, university:"UCLA")
    @doc2 = Doctor.create!(name: "Mike", years_practiced: 8, university:"Chicago College")
    @doc3 = Doctor.create!(name: "Jason", years_practiced: 11, university:"Boston College")
  end

  it "shows the attributes of all doctors" do
    visit doctor_index_path

    expect(page).to have_content(@doc1.name)
    expect(page).to have_content(@doc2.name)
    expect(page).to have_content(@doc3.name)
    expect(page).to have_content(@doc1.years_practiced)
    expect(page).to have_content(@doc2.years_practiced)
    expect(page).to have_content(@doc3.years_practiced)
    expect(page).to have_content(@doc1.university)
    expect(page).to have_content(@doc2.university)
    expect(page).to have_content(@doc3.university)
  end

  it 'shows doctors in order by years_practiced, from most to least' do
    visit doctor_index_path

    expect(@doc1.name).to appear_before(@doc2.name)
    expect(@doc1.name).to appear_before(@doc3.name)
    expect(@doc3.name).to appear_before(@doc2.name)
  end
end
