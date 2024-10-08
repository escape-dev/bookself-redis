class Book < ApplicationRecord

  def self.get_books
    books_array = JSON.parse(redis.get("books"))
    books_array.map { |book| JSON.parse(book)}
  end

  def self.set_book params 
    book_available = redis.get("books")
    book = JSON.parse(book_available)
    book = [] if book_available.nil?
    book.push({
      name: params[:name],
      description: params[:description],
    }.to_json)   
    
    redis.set("books", book)
  end

  def self.update_book params
    book_params = {
      name: params[:name],
      description: params[:description],
    }.to_json
    book_available = redis.get("books")    
    book = JSON.parse(book_available)
    book[params[:id]] = book_params

    redis.set("books", book)
  end

  def self.delete_book id 
    book = JSON.parse(redis.get("books"))
    book.delete_at(id)

    redis.set("books", book)
  end

  private 

  def self.redis
    Redis.new({ host: "localhost" })
  end

end
