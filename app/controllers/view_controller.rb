class ViewController < ApplicationController

  def form_tag
    @book = Book.new
  end

  def form_for
    @book = Book.new
  end

  def field
    @book = Book.new
  end

  def html5
    @book = Book.new
  end

  def select
    @book = Book.new(publish: '技術評論社')
  end

  def col_select
    # フォームのもととなるモデルを準備
    @book = Book.new(publish: '技術評論社')
    # 選択オプションの情報を取得
    @books = Book.select(:publish).distinct
  end

  def group_select
    @review = Review.new
    @authors = Author.all
  end

  def adopt
    render layout: 'sub'
  end

  def partial_basic
    @book = Book.find(1)
  end

end
