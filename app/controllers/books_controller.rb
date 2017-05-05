class BooksController < ApplicationController
  def index
    @books=Book.all
  end
  def show
    @book = Book.find_by(id: params[:id])
    redirect_to books_path, notice: "no data!" if @book.nil?
  end
  def new
    @book = Book.new
  end
  def create
    @book = Book.new(book_params)
  if  @book.save
      redirect_to books_path, notice: "create"
  else
    render 'new'
    #redirect_to new_candidate_path
  end
  end
  def book_params
    params.require("book").permit(:name, :introduction, :writer, :price)
  end
end
