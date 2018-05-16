class SearchController < ApplicationController
  def index
    @presenter = StationsPresenter.new(params[:q])
  end
end
