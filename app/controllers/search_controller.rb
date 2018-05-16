class SearchController < ApplicationController
  def index
    zipcode = params[:q]
    @stations = StationService.new(zipcode).stations
  end
end
