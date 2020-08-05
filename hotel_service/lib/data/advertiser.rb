require 'csv'

class Advertiser
  attr_accessor :id, :advertiser_name
  ADVERTISER_CSV = '/home/shravan/Downloads/Kannada_translation/data/advertisers.csv'

  def initialize
  end

  def fetch
    raw_advertiser = CSV.read(ADVERTISER_CSV)
    advertisers = []

    raw_advertiser.each_with_index do |advertiser, index|
      a = Advertiser.new
      a.id = advertiser[0]
      a.advertiser_name = advertiser[1]

      advertisers.append(a)
    end
    advertisers
  end

end

