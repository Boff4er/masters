class UserMailer < ActionMailer::Base
  default from: "bstclub-noreply@yandex.ru"
  
  def callback(email, password)
    @email = email
    @password = password
    
    
    mail(:to => 'ladakalina11194@yandex.ru', :subject => "[delorub.ru] Ваш пароль")
  end
    
end
