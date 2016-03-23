class HomeController < ApplicationController
  before action: :validate_airport :only :search
  def index
    @airports = Airport.all
  end

end
