class PagesController < ApplicationController
  def home
    @albums = Album.all
  end
end
