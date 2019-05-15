class RecordController < ApplicationController

  # IDを元にデータを検索する
  def find
    @books = Book.find([2, 5, 10])
    render 'hello/list'
  end

  # 任意のプロパティを元にデータを検索する
  # 検索件数は最初にヒットした1件のみ
  def find_by
    @book = Book.find_by(publish: '技術評論社')
    render 'books/show'
  end

  # AND検索
  def find_by2
    @book = Book.find_by(publish: '技術評論社', price: 2980)
    render 'books/show'  
  end

  def where
    @books = Book.where(publish: '技術評論社')
    render 'hello/list'
  end

  # プレイスホルダーを使用して任意のパラメーターを送る
  def ph1
    @books = Book.where('publish = :publish AND price >= :publish',
      params[:publish], params[:price])
    render 'hello/list'
  end

  def not
    @books = Book.where.not(isbn: params[:id])
    render 'books/index'
  end

  def where_or
    @books = Book.where(publish: '技術評論社').or(Book.where('price > 2500'))
    render 'hello/list'
  end

  def order
    @books = Book.where(publish: '技術評論社').order(published: :asc)
    render 'hello/list'
  end

  def select 
    @books = Book.where('price >= 2000').select(:title, :price)
    render 'hello/list'
  end

  def select2
    @books = Book.distinct.order(:publish)
    render 'hello/list'
  end

  def offset
    @books = Book.order(published: :desc).limit(3).offset(4)
    render 'hello/list'
  end

  # 価格の平均を算出
  # 算出するクエリをAS句を使ってviewで呼び出せるように(エイリアス)
  def groupby
    @books = Book.select('publish, AVG(price) AS avg_price').group(:publish)
  end

  # where!で条件一致したものだけにレシーバをオーバーライドしている
  def where2
    @books = Book.all
    @books.where!(publish: '技術評論社')
    @books.order!(:published)
    render 'books/index'
  end

  # scopeの呼出
  def scope
    # "技術評論社"を"降順"にする
    @books = Book.hoge
    render  'hello/list'
  end

  def def_scope
    render plain: Review.all.inspect
  end

  def transact
    Book.transaction do
      b1 = Book.new({isbn: '978-4-7741-5067-3', title: 'Rubyポケットリファレンス', price: 2580, publish: '技術評論社', published: '2017-04-17'})
      b1.save!
#      raise '例外発生：処理はキャンセルされました'
      b2 = Book.new({isbn: '978-4-7741-5067-5', title: 'Tomcatポケットリファレンス', price: 2580, publish: '技術評論社', published: '2017-04-17'})
      b2.save!
    end
    render plain: 'トランザクション成功'
    rescue => e
      render plain: e.message
  end
end
