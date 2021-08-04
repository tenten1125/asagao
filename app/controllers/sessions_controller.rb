class SessionsController < ApplicationController
  def create
    member = Member.find_by(email: session_params[:email])
    if member&.authenticate(session_params[:password])
      session[:member_id] = member.id
    else
      flash.alert = "名前とパスワードが一致しません"
    end
    redirect_to root_path
  end

  def destroy
    session.delete(:member_id)
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
