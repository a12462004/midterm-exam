class BooksController < ApplicationController
  before_action :find_candidate, only: [:show, :edit, :update, :destroy]
  def index
    @books=Book.all
  end
  def show
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
  end
  end
  def edit
  end
  def update
    if  @book.update(book_params)
      redirect_to books_path, notice: "update"
  else
    render 'update'
  end
  end
   def destroy
    @book.destroy
    #flash[:notice] = "deleted!"
    redirect_to books_path, notice: "deleted!"
  end
  def book_params
    params.require("book").permit(:name, :introduction, :writer, :price)
  end
  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])
    redirect_to candidates_path, notice: "no data!" if @candidate.nil?
  end
end
