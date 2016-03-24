class FlightController < ApplicationController
  def index
    @airports = Airport.all
  end
  def search
    @search_result = Flight.search_flight(flight_details[:from],
                        flight_details[:to],flight_details[:date]).available
  end
  def all
    @flights = Flight.all.available

  end

  def show
    @flight = Flight.find(params[:id])
    @number_of_passengers = params[:passenger]
  end

  private
  def flight_details
    params.require(:flight).permit(:from, :to,:date)
  end
end
