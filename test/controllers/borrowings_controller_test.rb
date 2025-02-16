require "test_helper"

class BorrowingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @book = books(:one)
    @borrowing = borrowings(:one)

    log_in_as(@user)
  end

  # Helper method to log in a user
  def log_in_as(user)
    post login_path, params: { session: { email: user.email, password: "password" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "should borrow a book successfully" do
    assert_difference -> { Borrowing.count }, 1 do
      post borrowings_url, params: { borrowing: { user_id: @user.id, book_id: @book.id, due_date: "2025-02-20 12:00:00" } }
    end
    assert_redirected_to books_path
  end

  test "should not borrow an already borrowed book" do
    Borrowing.create!(user: @user, book: @book, due_date: "2025-02-20 12:00:00")

    assert_no_difference -> { Borrowing.count } do
      post borrowings_url, params: { borrowing: { user_id: @user.id, book_id: @book.id, due_date: "2025-02-20 12:00:00" } }
    end
    assert_response :unprocessable_entity
  end

  test "should return a book" do
    patch borrowing_url(@borrowing), params: { borrowing: { returned: true } }
    @borrowing.reload
    assert @borrowing.returned, "Book should be marked as returned"
    assert_redirected_to books_path  # Ensure redirection aligns with controller
  end

  test "should show borrowing details" do
    get borrowing_url(@borrowing)
    assert_response :success
  end

  test "should handle invalid borrowing request" do
    assert_no_difference -> { Borrowing.count } do
      post borrowings_url, params: { borrowing: { user_id: nil, book_id: nil, due_date: nil } }
    end
    assert_response :unprocessable_entity
  end
end
