class BookingsController < ApplicationController

  def create
  end

  def new
    # @passenger = params[:passenger]
    # #@passenger = 1 if @passenger.nil? || @passenger.empty?
    # @flight = params[:id]
    @flight = Flight.find(params[:id])
    @number_of_passengers = params[:passenger]
  end

end
