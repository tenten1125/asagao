class AccountsController < ApplicationController
  # before_action :login_required
  def show
    @member = current_member
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    if @member.update(account_params)
      redirect_to account_path, notice: 'アカウント情報を更新しました'
    else
      render :edit
    end
  end
end
