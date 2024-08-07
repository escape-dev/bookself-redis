class BooksController < ApplicationController

  before_action :set_books, only: %i[ index edit ]

  def index 

  end

  def new 
    
  end

  def create 
    Book.set_book({ name: params[:name], description: params[:description] })

    redirect_to books_path
  end

  def edit
    @book = @books[params[:id].to_i]
    @id = params[:id].to_i
  end

  def update 
    Book.update_book({id: params[:id].to_i, name: params[:name], description: params[:description] })

    redirect_to books_path
  end

  def delete 
  
  end

  private 

  def set_books 
    @books = Book.get_books
  end

end
