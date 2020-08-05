require 'csv'

class City
  attr_accessor :id, :city_name, :cities
  CITY_CSV = '/home/shravan/Downloads/Kannada_translation/data/cities.csv'

  def initialize
    @cities = []
  end

  def fetch
    raw_cities = CSV.read(CITY_CSV)


    raw_cities.each_with_index do |city, index|
      c = City.new
      c.id = city[0]
      c.city_name = city[1]

      @cities.append(c)
    end

    @cities
  end

  def find_by_name name
    p "****#{@cities}"
    @cities.each_with_index do |city, index|
      p city.city_name
      if city.city_name == name
        return city
      end
    end
    return nil
  end


end
