class FlightController < ApplicationController

  def index
    @flights = Flight.includes(:from, :to).order(price: :asc)
  end
  def search
    @search_result = Flight.where("from_id = ? AND to_id = ? AND dept_date = ? ",
                flight_details[:from],flight_details[:to],flight_details[:date])
    respond_to do |format|

      format.js { render :js }
    end
  end

  private
  def flight_details
    params.require(:flight).permit(:from, :to,:date)
  end
end
