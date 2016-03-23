class FlightController < ApplicationController
  before_action :validate_airport, only: :search
  def index
    @airports = Airport.all
  end
  def search
    @search_result = Flight.search_flight(flight_details[:from],
                        flight_details[:to],flight_details[:date])
  end

  def validate_airport
    if flight_details[:from] == flight_details[:to]
      redirect_to root_url,
       notice: "Origin Airport and Departure Airport can't be the same"
       binding.pry
    end
  end

  private
  def flight_details
    params.require(:flight).permit(:from, :to,:date)
  end
end
