
This app is intended to display weather from the otherside of the world.


Todo:

 - Add coverage testing
 - Add travis-ci


Resource Notes:


 - City name to   GPS   lookup: http://www.geonames.org/export/web-services.html#findNearbyPlaceName
 -    GPS    to  city   lookup: http://www.geonames.org/export/web-services.html#findNearbyPlaceName
 -    GPS    to weather lookup: http://openweathermap.org/current#geo
 -     ''    to station lookup: http://www.geonames.org/export/JSON-webservices.html#findNearByWeatherJSON
 - Going to need to do bidirectional fraction to DMS convertion
    
 - SearchHTML: <%=http://api.geonames.org/search?name=la%20crosse&featureCode=PPL&maxRows=10&username=ENV["GEONAME"] %>