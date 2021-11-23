class UsersController < ApplicationController

  def index
    @users = User.all
    @user = User.find(current_user.id)  #[User Info用]@user にログイン中のユーザー情報を代入
    @books = Book.all                   #[一覧用]@books に投稿済みbookの全てのデータを代入
    @book = Book.new                    #[投稿用]@book にbookの投稿機能を代入
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
     render :edit
    else
     redirect_to user_path(@user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction,:profile_image)
  end

end
