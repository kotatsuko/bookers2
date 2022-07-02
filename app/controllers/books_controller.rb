class BooksController < ApplicationController
  def new
  end

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      render books_path
    end
  end

  def index
  @user=current_user
  @books=Book.all

  end

  def show
  end

  def edit
  end


  private

    def book_params
    params.require(:book).permit(:title,:body)
    end


end
