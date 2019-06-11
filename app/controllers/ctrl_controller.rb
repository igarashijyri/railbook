class CtrlController < ApplicationController
  before_action :start_logger, only:[:index, :index2]
  before_action :end_logger, except: :index
  around_action :around_logger
  before_action :auth, only: :index

  def get_xml
    @books = Book.all
    render xml: @books
  end

  def cookie
    @email = cookies[:email]
  end

  def cookie_rec
    cookies[:email] = { value: params[:email],
      expires: 3.months.from_now, http_only: true }
    render plain: 'クッキーを保存しました'
  end

  def session_show
    @email = session[:email]
  end

  def session_rec
    session[:email] = params[:email]
    render plain: 'セッションを保存しました'
  end

  def index
    sleep 3
    render plain: "iondexアクションが実行されました"
  end

  private

  def start_logger
    logger.debug('[Start]' + Time.now.to_s)
  end

  def end_logger
    logger.debug('[Finish]' + Time.now.to_s)
  end

  def around_logger
    logger.debug('[Finish]' + Time.now.to_s)
    yield
    logger.debug('[Finish]' + Time.now.to_s)
  end 

  def auth
    # 認証に必要なユーザ名/パスワード
    name = 'yyamada'
    passwd = '8cb2237d0679ca88db6464eac60da96345513964'
    # 入力値と期待値を比較
    authenticate_or_request_with_http_basic('Railsbook') do |n, p|
      n == name && Digest::SHA1.hexdigest(p) == passwd
    end
  end
end
