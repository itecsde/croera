class UserMailer < ActionMailer::Base
  default from: "itecsde@gmail.com"
  
  def task_status_changed()
    puts "aqui"
    mail(to: "marcosmourino@gmail.com", subject: 'Task status changed')
  end
    
end
