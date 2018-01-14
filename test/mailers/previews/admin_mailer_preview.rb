class AdminMailerPreview < ActionMailer::Preview
  def update_email
    AdminMailer.update_email(Admin.first, Admin.last)
  end
  def send_email
    AdminMailer.send_email(Admin.first.email, Admin.last.email, "Subject Test", "Message Test")
  end
end
