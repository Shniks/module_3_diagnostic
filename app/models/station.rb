class Station
  attr_reader :name,
              :address,
              :fuel_types,
              :distance,
              :access_times
  def initialize(attributes = {})
    @name = attributes[:station_name]
    @street_address = attributes[:street_address]
    @city = attributes[:city]
    @state = attributes[:state]
    @zip = attributes[:zip]
    @fuel_types = attributes[:fuel_type_code]
    @distance = attributes[:distance]
    @access_times = attributes[:access_days_time]
  end

  def address
    "#{street_address}, #{city}, #{state}, #{zip}"
  end

  private
    attr_reader :street_address,
                :city,
                :state,
                :zip
end
