class HomeController < ApplicationController
  before action: :validate_airport :only :search
  def index
    @airports = Airport.all
  end
  def search
    @search_result = Flight.search_flight(flight_details[:from],
                        flight_details[:to],flight_details[:date])
  end

  private
  def flight_details
    params.require(:flight).permit(:from, :to,:date)
  end
end
