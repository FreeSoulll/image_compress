require 'digest/md5'

class Account < ActiveRecord::Base
  validates :insales_id, :insales_subdomain, :password, presence: true

  def authentication(domain = insales_subdomain)
    token = Digest::MD5.hexdigest("Twulvyeik#{$$}#{Time.now.to_i}thithAwn")
    secret = ApiPassword.create(password, token)
    Rails.logger.info "pass is #{password} token(secret) is #{secret} for session token is #{token}"
    url = "https://#{domain}/admin/applications/#{::API_KEY}/login?token=#{token}&login=http://#{::API_HOST}/session/autologin"
    Rails.logger.info "url  is #{url}"
    [secret, url]
  end

  def init_api
    Rails.logger.info "configure api #{::API_KEY} #{insales_subdomain} #{password}"
    InsalesApi::Base.configure ::API_KEY, insales_subdomain, password
  end
end
