class BorrowingsController < ApplicationController
  before_action :set_borrowing, only: [:show, :update, :destroy]

  def create
    @borrowing = Borrowing.new(borrowing_params)

    if @borrowing.save
      redirect_to borrowings_path, notice: 'Book borrowed successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @borrowing.update(borrowing_params)
      redirect_to borrowing_path(@borrowing), notice: 'Borrowing updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @borrowing.destroy
    redirect_to borrowings_path, notice: 'Borrowing record deleted.'
  end

  def show
    redirect_to borrowing_path(@borrowing) and return if @borrowing.returned?

    @borrowing.update(due_date: Time.now) if @borrowing.due_date < Time.now
  end

  private

  def set_borrowing
    @borrowing = Borrowing.find(params[:id])
  end

  def borrowing_params
    params.require(:borrowing).permit(:user_id, :book_id, :due_date, :returned)
  end
end
