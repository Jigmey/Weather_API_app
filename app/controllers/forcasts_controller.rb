class ForcastsController < ApplicationController
	def index
		forecast= Weather.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22queens%2C%20ny%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys").body
		@nyc_weather=forecast["query"]["results"]["channel"]["item"]
		if params[:search]
			forecast=forecast.search(params[:search])
		end
		render 'index.html.erb'	
	end

end
