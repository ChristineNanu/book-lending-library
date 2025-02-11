class BorrowingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:create]

  def create
    if @book.available?
      borrowing = current_user.borrowings.create(book: @book)
      redirect_to books_path, notice: "You have successfully borrowed #{@book.title}!"
    else
      redirect_to books_path, alert: "Book is already borrowed."
    end
  end

  def update
    borrowing = current_user.borrowings.find(params[:id])
    borrowing.update(returned: true)
    redirect_to user_profile_path, notice: "Book returned successfully!"
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end
end
