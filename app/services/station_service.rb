class StationService
  def initialize(zipcode)
    @zipcode = zipcode
  end

  def stations
    conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.format?")
    binding.pry

  end
end
