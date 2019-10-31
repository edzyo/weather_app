class WeatherController < ApplicationController

  def search
    begin
     @weather = Owa::Current.by_city(params[:city])
    rescue Owa::OwaErrors => e
      flash.now[:error] = e.message
    end
    respond_to do |format|
       format.html
       format.js do
        return render json: {weather: @weather}.to_json
       end
    end
  end
end
