require "test_helper"

class BorrowingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)  
    @book = books(:one)  
    @borrowing = borrowings(:one)  
  end

  test "should borrow a book successfully" do
    assert_difference('Borrowing.count', 1) do
      post borrowings_url, params: { borrowing: { user_id: @user.id, book_id: @book.id, due_date: "2025-02-20 12:00:00" } }
    end
    assert_response :redirect
  end

  test "should not borrow an already borrowed book" do
    @book.update(available: false)
    assert_no_difference('Borrowing.count') do
      post borrowings_url, params: { borrowing: { user_id: @user.id, book_id: @book.id, due_date: "2025-02-20 12:00:00" } }
    end
    assert_response :unprocessable_entity
  end

  test "should return a book" do
    patch borrowing_url(@borrowing), params: { borrowing: { returned: true } }
    assert @borrowing.reload.returned
    assert_response :redirect
  end

  test "should show borrowing details" do
    get borrowing_url(@borrowing)
    assert_response :success
  end

  test "should handle invalid borrowing request" do
    post borrowings_url, params: { borrowing: { user_id: nil, book_id: nil, due_date: nil } }
    assert_response :unprocessable_entity
  end
end
