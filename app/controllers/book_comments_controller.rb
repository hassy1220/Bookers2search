class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    comment = BookComment.new(comment_params)
    comment.user_id = current_user.id
    comment.book_id = @book.id
    comment.save
    redirect_to book_path(@book.id)
  end
  def destroy
    comment = BookComment.find(params[:id])
    comment.destroy
    redirect_to book_path(params[:book_id])
  end
  private
  def comment_params
    params.require(:book).permit(:comment)
  end
end
