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
    
    # Expct Weather conditions:
    # -Temp
    # -Wind (speed/direction)
    # -Coordinates
    # -weather
    
    # City name to   GPS   lookup: http://www.geonames.org/export/web-services.html#findNearbyPlaceName
    #    GPS    to  city   lookup: http://www.geonames.org/export/web-services.html#findNearbyPlaceName
    #    GPS    to weather lookup: http://openweathermap.org/current#geo
    #     ''       station lookup: http://www.geonames.org/export/JSON-webservices.html#findNearByWeatherJSON
    # Going to need to do bidirectional fraction to DMS convertion
    
    #SearchHTML: <%=http://api.geonames.org/search?name=la%20crosse&featureCode=PPL&maxRows=10&username=ENV["GEONAME"] %>
    
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