class Admin::GenresController < ApplicationController
  def  index
    @genre = Genre.new
    @genres = Genre.all
  end

  def  create
    @genre = Genre.new(genre_params)
    @genre.save
  end
  
  def  edit
  end
  
end
