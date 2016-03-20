class HomeController < ApplicationController
  def index
    @airports = Airport.all
  end
  def search
  end
end
