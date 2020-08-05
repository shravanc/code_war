require 'csv'


class HotelAdvertiser
  attr_accessor :advertiser_id, :hotel_id, :cpc, :price, :currency, :availability_start_date, :availability_end_date, :data, :hotel_rating, :hotel_name, :stars

  CSV_FILE = '/home/shravan/Downloads/Kannada_translation/data/hotel_advertiser.csv'
  TEST_CSV_FILE = '/home/shravan/Downloads/Kannada_translation/data/hotel_advertiser_1.csv'

  def initialize
    @data = []
  end

  def fetch
    raw_data = CSV.read(CSV_FILE, headers: false)
    @data = []

    raw_data.each_with_index do |d, index|
      next if index == 0

      ha = HotelAdvertiser.new
      ha.advertiser_id = d[0]
      ha.hotel_id = d[1]
      ha.cpc = d[2]
      ha.price = d[3]
      ha.currency = d[4]
      ha.availability_start_date = d[5].to_date
      ha.availability_end_date = d[6].to_date

      @data.append(ha)
    end
    @data
  end

  def find_by params

    available = []
    params[:hotels].each do |hotel|
      if hotel.city_id == params[:city_id]
        @data.each do |d1|

          if d1.hotel_id == hotel.id and d1.availability_start_date == params[:startDate].to_date and d1.availability_end_date == params[:endDate].to_date
            data = {}          
            data['hotel_id'] = hotel.id
            data['hotel_name'] = hotel.name
            data['stars'] = hotel.stars
            data['rating'] = hotel.rating
            
            offers = {}
            offers['advertiser_id'] = d1.advertiser_id
            offers['cpc'] = d1.cpc
            offers['price'] = d1.price
            offers['currency'] = d1.currency

            data['offers'] = offers


            available.append(data)
          end
        end


      end
    end

    available = available.sort_by{|obj| obj["hotel_rating"]}
    return available
  end


  def update data
    CSV.open(TEST_CSV_FILE, "w") do |csv|
      data = data[:data]
      headers = data[0].keys

      csv << headers
      data.each do |d1|
        csv << d1.values
      end
    end

  end

end

