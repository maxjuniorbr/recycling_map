class PagesController < ApplicationController
  def index
    @collection_points = CollectionPoint.all
  end
end
