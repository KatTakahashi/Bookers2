class BooksController < ApplicationController
  def index
    @user = User.find(current_user.id)  #[User Info用]@user にログイン中のユーザー情報を代入
    @books = Book.all                   #[一覧用]@books に投稿済みbookの全てのデータを代入
    @book = Book.new                    #[投稿用]@book にbookの投稿機能を代入

  end

  def show
    @user = User.find(current_user.id)  #[投稿user用]@userにログイン中のユーザー情報を代入
    @books = Book.all                   #[book詳細用]@bookに特定のidの情報を代入
    @book = Book.new
  end

  def create
    @user = User.find(current_user.id)   #UserモデルのUser_id    ■[book] belongs to [user], [user] has many [books]
    @book = Book.new(book_params)         #[投稿用]@book にbookの投稿機能を代入
    @book.user_id = current_user.id       #[投稿用]投稿者のidとbookのidを紐づけ
    @book.save                            #[投稿用]投稿内容を保存
    redirect_to books_path                #[投稿用]投稿後、bookのshowページへリダイレクト

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:id])   #[削除用]bookのデータを取得
    book.destroy                    #[削除用]bookのデータを削除
    redirect_to books_path          #[削除用]book一覧画面へリダイレクト
  end

  private

  def book_params
   params.require(:book).permit(:title, :body)
  end


end
