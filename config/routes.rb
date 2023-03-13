Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      match 'authentication', to: 'authentication#login', via: :post
      match 'inbound', to: 'messages#inbound', via: :post
      match 'outbound', to: 'messages#outbound', via: :post
    end
  end
end

