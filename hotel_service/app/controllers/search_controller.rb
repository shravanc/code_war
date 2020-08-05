class SearchController < ApplicationController

  def index

    search = Search.new
    data = search.filter(params)




    render json: data, status: :ok
    return
  end
end
