require 'rails_helper'

RSpec.feature "Otherside weather search" do


  before do
  end
  
  scenario "check page layout" do
    visit "/"
    expect(page).to have_field("Search") # Search field
    expect(page).to have_content("Otherside Weather") # Branding
    expect(page).to have_content("Weather from the otherside") # Slogan
  end

  scenario "successful search: city, town" do
    query = "Charlotte, North Carolina"
    #cordinates_lat = "N 35° 13' 37''"
    #cordinates_long = "W 80° 50' 35''"
    perform_otherside_weather_search(query)
    expect(page).to have_content("Weather on the otherside of #{query}")
    #expect(page).to have_content("Coodinates: ")
    
    # Expect Weather conditions:
    # -Temp
    # -Wind (speed/direction)
    # -Coordinates
    # -weather
    
    # Expect distance to exact opposite (based on expected GPS coodinates)
    
  end

  scenario "Search is unsuccessful, display errors" do
    query = "invalid, invalid"
    perform_otherside_weather_search(query)
    
    expect(page).to have_content("Could not find weather on the otherside of #{query}")
  end
  
  #--------------------------------------------------------------------
  #--------------------------Helper functions--------------------------
  #--------------------------------------------------------------------
  
  def perform_otherside_weather_search(query)
    visit "/"
    fill_in "Search", with: query
  end

end