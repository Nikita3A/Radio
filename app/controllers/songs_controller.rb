class SongsController < ApplicationController
    before_action :set_album
    before_action :set_song, only: [:destroy]
  
    # def create
    #   @song = @album.songs.build(song_params)
    #   if @song.save
    #     redirect_to edit_album_path(@album), notice: 'Song was successfully added.'
    #   else
    #     render 'albums/edit'
    #   end
    # end
    def create
        @song = @album.songs.build(song_params)
        Rails.logger.debug "Song Params: #{song_params.inspect}"
        if @song.save
          redirect_to edit_album_path(@album), notice: 'Song was successfully added.'
        else
          Rails.logger.debug "Errors: #{@song.errors.full_messages.inspect}"
          @songs = @album.songs
          render 'albums/edit'
        end
    end
      
  
    def destroy
        @song.destroy
        redirect_to edit_album_path(@album), notice: 'Song was successfully deleted.'
    end

    private
  
    def set_album
      @album = Album.find(params[:album_id])
    end

    def set_song
        @song = @album.songs.find_by(id: params[:id])
        if @song.nil?
          redirect_to edit_album_path(@album), alert: 'Song not found.'
        end
    end
  
    def song_params
      params.require(:song).permit(:title, :duration, :lyrics)
    end
  end
  