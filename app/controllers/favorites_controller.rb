class FavoritesController < ApplicationController
  def create
  	@favorite = Favorite.new
  	@favorite.book_id = params[:book_id]
    @favorite.user_id = params[:user_id]

  	respond_to do |format|
  		if @favorite.save
        format.html { redirect_to :back, notice: 'favorite was successfully created.' }
        format.json { render json: @favorite, status: :created, location: @favorite }
      else
        format.html { redirect_to :back, notice: 'favorite could not be created' }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
  	end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to :back
  end
end
