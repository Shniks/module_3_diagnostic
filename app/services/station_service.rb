class StationService
  def initialize(zipcode)
    @zipcode = zipcode
  end

  def stations
    binding.pry
    raw_stations.map { |raw_station| Station.new(raw_station) }
  end

  def conn
    conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json")
  end

  def response
    response ||= conn.get do |request|
      request.headers['X-API-KEY'] = ENV['API_KEY']
      request.params[:location] = @zipcode
      request.params[:radius] = 10
      request.params[:fuel_type] = "ELEC,LPG"
      request.params[:limit] = 10
    end
  end

  def raw_stations
    JSON.parse(response.body, symbolize_names: true)[:results]
  end
end
