class BooksController < ApplicationController

  def new
  end

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
      flash[:notice]="You have created book successfully."
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
    @books=Book.find(params[:id])
    @user=User.find(@books.user_id)
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]="You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render edit_book_path(@book.id)
    end
  end

    def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to books_path
    end


  private

    def book_params
      params[:book].permit(:title,:body)
    end


end
