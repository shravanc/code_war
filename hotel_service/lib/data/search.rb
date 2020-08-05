class Search
  attr_accessor :city, :hotel, :advertiser, :hotel_advertiser
  
  def initialize
    @city = City.new
    @hotel = Hotel.new
    @advertiser = Advertiser.new
    @hotel_advertiser = HotelAdvertiser.new

    @city.fetch
    @hotel_advertiser.fetch
    @hotel.fetch
    @advertiser.fetch
  end


  def filter params
    city = params[:city]
    startDate = params[:startDate]
    endDate = params[:endDate]

    city_obj = @city.find_by_name(city)
    hotel_obj= @hotel.find_by_city_id(city_obj.id)


    hotel_advertiser = @hotel_advertiser.find_by(city_id: city_obj.id, hotels: hotel_obj, startDate: startDate, endDate: endDate)


    return hotel_advertiser
  end



end
