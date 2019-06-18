class SendmailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    NoticeMailer.sendmail_confirm(user).deliver_now
  end
end
