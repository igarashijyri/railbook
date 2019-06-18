class ExtraController < ApplicationController

  def set_job
    user = User.find(6)
    SendmailJob.perform_later(user)
    render plain '正しく実行できました。'
  end

end
