class PagesController < ApplicationController
  def home
    @albums = Album.includes(:songs)
  end
end
