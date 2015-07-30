class ApplicationMailer < ActionMailer::Base
  default from: "stribbon@icloud.com"
  default_url_options[:host] = ENV['URL']
end