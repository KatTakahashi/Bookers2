class BooksController < ApplicationController
  def index
    @user = User.find(current_user.id)  #@user にログイン中のユーザー情報を代入
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)    #@book にbookの投稿機能を代入
    @book.user_id = current_user.id  #投稿者のidとbookのidを紐づけ
    @book.save                       #投稿内容を保存
    redirect_to book_path(@book.id)  #投稿後、bookのshowページへリダイレクト
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private


  def book_params
   params.require(:book).permit(:title, :body)
  end

end
