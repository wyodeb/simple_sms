Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      match 'authentication', to: 'authentication#login', via: :post
      match 'inbound/sms', to: 'messages#inbound', via: :post
      match 'outbound/sms', to: 'messages#outbound', via: :post
    end
  end
end

