class BooksController < ApplicationController

  def index 
    
  end

  def new 
    
  end

  def create 
    Book.set_book({ name: params[:name], description: params[:description] })

    redirect_to books_path
  end

  def update 
    
  end

  def delete 
  
  end

end
