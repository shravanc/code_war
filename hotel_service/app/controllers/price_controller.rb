class PriceController < ApplicationController

def create
  hd = HotelAdvertiser.new
  p "---->#{hotel_advertiser_params}"
  hd.update(hotel_advertiser_params)

  render json: {}, status: :ok
end


private
def hotel_advertiser_params
  params.require(:price).permit(data: [ [:advertiser_id, :hotel_id, :cpc, :price, :currecncy, :availability_start_date, :availability_end_date]])
end

end
