Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :appointments, only: %i[show update destroy]

      resources :doctors, only: [] do
        resources :availabilities, only: %i[index create destroy]
        resources :slots, only: %i[index]
        resources :appointments, only: %i[index create]
      end
    end
  end

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
end
