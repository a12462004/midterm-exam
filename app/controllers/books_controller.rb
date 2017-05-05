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
  def edit
    @book = Book.find_by(id: params[:id])
    redirect_to books_path, notice: "no data!" if @book.nil?
  end
  def update
    @book = Book.find_by(id: params[:id])
    redirect_to books_path, notice: "no data!" if @book.nil?
    if  @book.update(book_params)
      redirect_to books_path, notice: "update"
  else
    render 'update'
  end
  end
   def destroy
    @book = Book.find_by(id: params[:id])
    redirect_to books_path, notice: "no data!" if @book.nil?
    @book.destroy
    #flash[:notice] = "deleted!"
    redirect_to books_path, notice: "deleted!"
  end
  def book_params
    params.require("book").permit(:name, :introduction, :writer, :price)
  end
end
