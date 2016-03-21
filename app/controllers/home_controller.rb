class HomeController < ApplicationController
  def index
    @airports = Airport.all
  end
  def search
    @search_result = Flight.where("from_id = ? AND to_id = ? AND dept_date = ? ",
                flight_details[:from],flight_details[:to],flight_details[:date])
    if @search_result.empty? || @search_result.nil?
      flash[:notice] = 'No Flights. Please search again or check The list for avaailable flight'
    end
    redirect_to root_path(@search_result)
  end

  private
  def flight_details
    params.require(:flight).permit(:from, :to,:date)
  end
end
