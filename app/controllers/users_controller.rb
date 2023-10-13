class UsersController < ApplicationController

  def index
    @user=User.all

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save   # ユーザーが保存された場合の処理
      redirect_to root_path
    else
       render 'new'  # ユーザーが保存されなかった場合の処理
    end
  end


  def destroy
    @user=User.find(params[:id])
    @user.destroy
    redirect_to root_path # ログアウト後のリダイレクト先を指定します
  end


  private

  def user_params
    params.require(:user).permit(:id, :nickname, :email, :password, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day)
  end
 end




