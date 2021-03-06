require 'rails_helper'

RSpec.feature "Visitor navigates to homepage", type: :feature, js: true do

  before :each do
    10.times do |n|
      City.create!(
        name: Faker::HarryPotter.location,
        country: Faker::HarryPotter.location,
        description: Faker::HarryPotter.quote,
        language: 'English',
        currency: 'CAD',
        transit: 'www.translink.ca',
        emergency_phone: '911',
        time_zone: 'PST (UTC-8h)',
        tipping_custom: '18%',
        image: 'cities/city_vancouver1.jpg'
      )
    end
  end

  scenario "They see all cities" do
    visit root_path
    expect(page).to have_css 'div.city-card', count: 10
  end

end
