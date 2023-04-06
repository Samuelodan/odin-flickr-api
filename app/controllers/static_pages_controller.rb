class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new
    if params[:user_id]
      begin
        unless params[:user_id].empty?
          @photos = flickr.photos.search(user_id: params[:user_id])
          @photos = @photos.first(10)
        end
      rescue Flickr::FailedResponse
        flash.now[:alert] = "User doesn't exist"
        @photos = nil
      end

    end
  end
end
