class ApiService::Base
  def self.refresh_api_info
    @api_info = Kredis.hash 'api_info'
    @api_info.clear
    ApiToken.all.each do |api_token|
      @api_info.update(
        api_token.name => api_token.token
      )
    end
  end
end
