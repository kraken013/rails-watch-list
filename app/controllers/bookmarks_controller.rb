class BookmarksController < ApplicationController

  before_action :set_list, only: [:new, :create]
  before_action :set_bookmark, only: [:destroy]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params) # on crée un nouveau bookmark avec les paramètres du formulaire (comment, movie_id, list_id)
    @bookmark.movie = Movie.find(params[:bookmark][:movie_id]) # on récupère le movie_id dans le formulaire et on le transforme en objet Movie pour l'associer au bookmark qu'on est en train de créer (ligne 20)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list), notice: 'Bookmark was successfully created.' # notice est une clé de hash qui permet de stocker un message flash
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id) # on récupère les paramètres du formulaire (comment, movie_id, list_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
