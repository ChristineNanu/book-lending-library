require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  # Other tests...

  # Remove or rename this duplicate test method
  # test "should borrow a book successfully" do
  #   assert_difference -> { Borrowing.count }, 1 do
  #     post borrowings_url, params: { borrowing: { user_id: @user.id, book_id: @book.id, due_date: "2025-02-20 12:00:00" } }
  #   end
  #   assert_redirected_to books_path
  # end
end