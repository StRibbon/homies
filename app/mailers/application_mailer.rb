class ApplicationMailer < ActionMailer::Base
  default from: "stribbon@icloud.com"
  default_url_options[:host] = "localhost:3000"
end