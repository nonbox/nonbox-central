Rails.application.routes.draw do

  scope :v1, defaults: {format: :json} do
    scope :companion do
      get  'tutorials', to: 'v1/companion#tutorials'
      post 'report/:type', to: 'v1/companion#report'
    end
  end

  root 'application#index'
end
