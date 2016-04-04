class HomeController < ApplicationController
  def index
    @airports = Airport.all
  end
end
