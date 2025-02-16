class UsersController < ApplicationController
  def destroy
    @user = User.find(params[:id])

    if @user.borrowings.any?
      @user.borrowings.destroy_all  # Delete borrowings before user
    end

    if @user.destroy
      redirect_to users_path, notice: "User deleted successfully."
    else
      redirect_to users_path, alert: "Failed to delete user. Ensure there are no dependencies."
    end
  end
end