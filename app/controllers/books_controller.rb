class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = "You have created book successfully."
      redirect_to books_path
    else
      flash.now[:danger] = "not success"
      render 'books/edit'
    end
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:success] = "You have updated book successfully."
       redirect_to books_path
    else
       flash.now[:danger] = "not success"
       render 'books/edit'
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path(book)
  end

  private

  def book_params
    params.permit(:title, :body)
  end

end
