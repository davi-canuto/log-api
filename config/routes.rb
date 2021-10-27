Rails.application.routes.draw do
  resources :infos do
    collection do
      post 'new_infos'
    end
  end
  resources :logs do
    collection do
      post 'upload_batch'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
