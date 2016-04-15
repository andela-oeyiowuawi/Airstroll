class FlightController < ApplicationController
  def index
    @airports = Airport.all
    @flights =  Flight.all.paginate(page: params[:page], per_page: 8)
  end

  def search
    @search_result = Flight.search_flight(flight_details[:from],
                                          flight_details[:to],
                                          flight_details[:date]).available
  end

  private

  def flight_details
    params.require(:flight).permit(:from, :to, :date)
  end
end
