class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def index
    @books = Book.all
  end

  def show
    @comment = BookComment.new
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      redirect_to pages_profile_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @book.user == current_user
      if @book.update(book_params)
        redirect_to pages_profile_path
      else
        render :edit, status: :unprocessable_entity
      end
    else
      # new error
    end
  end

  def destroy
    if current_user == @book.user
      @book.destroy
      redirect_to pages_profile_path
    else
      # new error
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:user_id, :name, :author, :media, :editional, :rating, :comment)
    end
end
