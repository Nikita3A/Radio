class AlbumsController < ApplicationController
    include SessionsHelper
    # Вимагати авторизації, наприклад, для адміністраторів
    before_action :set_album, only: %i[show edit update destroy]
    before_action :authorize_admin, except: %i[index show]
  
    # Дія для перегляду всіх альбомів
    def index
      @albums = Album.all
    end
  
    # Дія для перегляду одного альбому
    def show
    end
  
    # Дія для створення нового альбому (форма)
    def new
      @album = Album.new
    end
  
    def create
        @album = Album.new(album_params)
        @album.duration = 0 # Встановлюємо значення поля duration
        
        # Set a default image if none is provided
        unless @album.image.attached?
            @album.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'melody.png')), filename: 'melody.png')
        end

        if @album.save
          redirect_to root_path, notice: "Album created successfully."
        else
          render :new
        end
    end
  
    # Дія для редагування існуючого альбому (форма)
    def edit
      @album = Album.find(params[:id])
      @song = @album.songs.build # Create a new song instance to use in the form
    end
  
    # Дія для оновлення альбому
    def update
      if @album.update(album_params)
        # redirect_to @album, notice: 'Album was successfully updated.'
        redirect_to root_path, notice: 'Album was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @album = Album.find(params[:id])
      @album.destroy
      redirect_to root_path, notice: 'Album was successfully deleted.'
    end
    
    private
  
    # Знаходження альбому для дій show, edit, update, destroy
    def set_album
      @album = Album.find(params[:id])
    end
  
    # Дозволені параметри для альбому
    def album_params
        params.require(:album).permit(:title, :artist, :release_year, :copies, :image)
    end

    # Перевірка, чи є користувач адміністратором
    def authorize_admin
      redirect_to root_path, alert: 'Access denied!' unless current_user&.admin?
    end
  end
  