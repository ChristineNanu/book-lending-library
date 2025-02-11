require "test_helper"

class BorrowingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)  # Assuming you have a fixture for users
    @book = books(:one)  # Assuming you have a fixture for books
    @borrowing = borrowings(:one)  # Assuming you have a fixture for borrowings

    sign_in @user  # Devise helper (if using Devise)
  end

  test "should borrow a book if available" do
    assert_difference("Borrowing.count", 1) do
      post borrowings_url, params: { book_id: @book.id }
    end

    assert_redirected_to user_path(@user)
    assert_equal "Book borrowed successfully!", flash[:notice]
  end

  test "should not allow borrowing if book is already borrowed" do
    Borrowing.create!(user: @user, book: @book, due_date: Date.today + 14.days)

    assert_no_difference("Borrowing.count") do
      post borrowings_url, params: { book_id: @book.id }
    end

    assert_redirected_to books_url
    assert_equal "Book is already borrowed!", flash[:alert]
  end

  test "should return a book" do
    assert_difference("Borrowing.count", -1) do
      delete borrowing_url(@borrowing)
    end

    assert_redirected_to user_path(@user)
  end
end
