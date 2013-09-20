require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Windowslive < OmniAuth::Strategies::OAuth2
      
      DEFAULT_SCOPE = 'wl.basic,wl.emails,wl.photos'
      
      option :client_options, {
        :site => 'https://login.live.com',
        :authorize_url => '/oauth20_authorize.srf',
        :token_url => '/oauth20_token.srf'
        }
      
      option :authorize_params, {
        :response_type => 'code'
        }
      
      option :name, 'windowslive'
      
      uid { raw_info['id'] }
      
      info do
        {
          'id' => @raw_info['id'],
          'email' => @raw_info['emails']['preferred'] || raw_info['emails']['account'],
          'name' => @raw_info['name'],
          'first_name' => @raw_info['first_name'],
          'last_name' => @raw_info['last_name'],
          'link' => @raw_info['link'],
          'locale' => @raw_info['locale'],
          'updated_time' => @raw_info['updated_time']
          }
      end
      
      extra do
        {
          'raw_info' => raw_info
          }
      end
      
      def raw_info
        request = 'https://apis.live.net/v5.0/me'
        @raw_info ||= MultiJson.decode(access_token.get(request).body)
      end
      
    end
  end
end

OmniAuth.config.add_camelization 'windowslive', 'Windowslive'