class BookCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :comment_params, only: %i[ create ]

  def create
    @comment = BookComment.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to book_path(@comment.book)
    else
      # new error
    end
  end

  def destroy
    @comment = BookComment.find(params[:id])
    if @comment.user == current_user || @comment.book.user == current_user
      @comment.destroy
      redirect_to book_path(@comment.book)
    else
      # new error
    end
  end

  private
    def comment_params
      params.require(:book_comment).permit(:book_id, :comment)
    end
    
end