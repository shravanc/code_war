require 'csv'


class Hotel
  attr_accessor :id, :city_id, :clicks, :impressions, :name, :rating, :stars, :hotel_csv, :hotels
  HOTEL_CSV = '/home/shravan/Downloads/Kannada_translation/data/hotels.csv'

  def initialize()
    @hotels = []
  end

  def fetch()
    raw_hotels = CSV.read(Hotel::HOTEL_CSV, headers: false)


    raw_hotels.each_with_index do |hotel, index|
      next if index == 0
      h = Hotel.new

      h.id = hotel[0]
      h.city_id = hotel[1]
      h.clicks = hotel[2]
      h.impressions = hotel[3]
      h.name = hotel[4]
      h.rating = hotel[5].to_i
      h.stars = hotel[6]

      @hotels.append(h)
    end
    
    @hotels
  end

  def find_by_city_id city_id
    hotels = []
    @hotels.each_with_index do |hotel, index|
      if hotel.city_id == city_id
        hotels.append(hotel)
      end
    end

    hotels
  end

end

