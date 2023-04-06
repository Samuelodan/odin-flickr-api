class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new
    if params[:user_id]
      unless params[:user_id].empty?
        @photos = flickr.photos.search(user_id: params[:user_id])
        @photos = @photos.first(10)
      end
    end
  end
end
