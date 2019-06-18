class AjaxController < ApplicationController
  def upanel
  end

  def search
    @books = Book.select(:publish).distinct
  end

  def result
    @books = Book.where(:pubkish: params[:publish]
  end
end
