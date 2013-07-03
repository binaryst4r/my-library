class BooksController < ApplicationController

  def index
    @user = User.find(session[:id])
    @book = Book.new
    @books = @user.books
    @favorites = @user.favorites
  end
  
  def create
  	@book = Book.new(params[:book])

  	respond_to do |format|
      if @book.save
        format.html { redirect_to :back, notice: 'book was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { redirect_to :back, notice: 'book could not be created' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.update_attributes(params[:book])
    redirect_to :back
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  end
end
