Rails.application.routes.draw do
  devise_for :users
  root to: 'notes#index'

  resources :notes, except: [:new]

  post '/users/:id/add_note/:note_id', to: 'users#add_note'
  delete '/users/:id/remove_note/:note_id', to: 'users#remove_note'

  post '/tags/:title/add_to_note/:note_id', to: 'tags#add_to_note'
  delete '/tags/:title/remove_from_note/:note_id', to: 'tags#remove_from_note'
end
