require 'rails_helper'

RSpec.feature "Otherside weather search" do


  before do
  end

  scenario "successful search: city, town" do
    query = "Charlotte, North Carolina"
    perform_otherside_weather_search(query)
    expect(page).to have_content("Weather on the otherside of #{query}")
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