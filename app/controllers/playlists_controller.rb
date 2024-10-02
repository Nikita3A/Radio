class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :remove_song]

  def new
    @playlist = Playlist.new
  end

  def create
    # Rails.logger.debug("Received params: #{params.inspect}")
    @playlist = Playlist.new(playlist_params)
    @playlist.user = current_user
    # Rails.logger.debug("Playlist Params: #{playlist_params.inspect}")
    if @playlist.save
      redirect_to @playlist, notice: 'Playlist was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @playlist = Playlist.find_by(id: params[:id])
    if @playlist
      @playlist.destroy
      redirect_to playlists_path, notice: 'Playlist was successfully deleted.'
    else
      redirect_to playlists_path, alert: 'Playlist not found.'
    end
  end
  
  def add_to_playlist
    @playlist = Playlist.find(params[:playlist_id])
    @song = Song.find(params[:song_id])
  
    # Here, you'd want to add the song to the playlist
    # This assumes a many-to-many relationship between songs and playlists
    if @playlist.songs << @song
      redirect_to album_path(@song.album), notice: 'Song added to playlist successfully.'
    else
      redirect_to album_path(@song.album), alert: 'Error adding song to playlist.'
    end
  end

  def index
    @playlists = Playlist.all
    @playlist = Playlist.new # Initialize a new Playlist object
  end

  # def remove_song
  #   song = Song.find(params[:song_id])
  #   @playlist.songs.delete(song)  # Remove the song from the playlist

  #   # Redirect back to the playlist's show page
  #   redirect_to @playlist, notice: "Song has been removed from the playlist."
  # end
  # def remove_song
  #   song = Song.find(params[:song_id])
  #   Rails.logger.debug("Playlist ID: #{params[:playlist_id]}")
  #   Rails.logger.debug("Playlist: #{@playlist.inspect}")
  
  #   @playlist.songs.delete(song)  # Remove the song from the playlist
  #   redirect_to @playlist, notice: "Song has been removed from the playlist."
  # end
  # def remove_song
  #   Rails.logger.debug("Playlist: #{@playlist.inspect}")

  #   @playlist = Playlist.find(params[:playlist_id]) # Ensure the playlist is found correctly
  #   song = Song.find(params[:song_id])
  #   @playlist.songs.delete(song)
  
  #   redirect_to @playlist, notice: "Song has been removed from the playlist."
  # end
  def remove_song
    Rails.logger.debug("Parameters: #{params.inspect}")
    
    @playlist = Playlist.find(params[:playlist_id]) 
    Rails.logger.debug("Found Playlist: #{@playlist.inspect}")
  
    song = Song.find(params[:song_id])
    @playlist.songs.delete(song)
  
    redirect_to @playlist, notice: "Song has been removed from the playlist."
  end
  
  
  

  def show
    @songs = @playlist.songs # This should fetch the songs associated with the playlist
  end

  private

  # def set_playlist
  #   Rails.logger.debug("Params: #{params.inspect}") # Log params for debugging
  #   # @playlist = Playlist.find(params[:playlist_id])
  #   @playlist = Playlist.find(params[:id])
  #   # @playlist = Playlist.find(params[:playlist_id]) # Use the correct parameter to find the playlist
  # end 
  def set_playlist
    Rails.logger.debug("Params: #{params.inspect}") # Log params for debugging
    if action_name == 'remove_song'
      @playlist = Playlist.find(params[:playlist_id]) # For remove_song action
    else
      @playlist = Playlist.find(params[:id]) # For show action
    end
  end
  

  def playlist_params
    params.require(:playlist).permit(:name, :description)
  end
end
