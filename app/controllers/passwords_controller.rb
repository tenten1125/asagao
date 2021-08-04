class PasswordsController < ApplicationController
  # before_action :login_required
  def show
    redirect_to account_path
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    current_password = password_params[:current_password]
    if current_password.present?
      if @member.authenticate(password_params[:current_password])
        if @member.update(password_params)
          redirect_to account_path, notice: "パスワードを変更しました。"
        else
          render :edit
        end
      else
        @member.errors.add(:current_password, :wrong)
        render :edit
      end
    else
      @member.errors.add(:current_password, :empty)
      render :edit
    end
  end

  private

  def password_params
    params.require(:password).permit(:current_password, :password, :password_confirmation)
  end
end
