require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one) # Assuming you have fixture data
  end

  test "should get index" do
    get books_url
    assert_response :success
    assert_not_nil assigns(:books)
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end
end
