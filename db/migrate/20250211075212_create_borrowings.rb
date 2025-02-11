class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :due_date, presence: true

  before_create :set_due_date, :mark_book_unavailable
  before_update :mark_book_available, if: -> { returned? }

  private

  def set_due_date
    self.due_date = 2.weeks.from_now
  end

  def mark_book_unavailable
    book.update(available: false)
  end

  def mark_book_available
    book.update(available: true)
  end
end
