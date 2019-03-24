# Preview all emails at http://localhost:3000/rails/mailers/notice
class NoticePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notice/sendmail_confirm
  def sendmail_confirm
    Notice.sendmail_confirm
  end

end
