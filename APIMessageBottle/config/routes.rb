APIMessageBottle::Application.routes.draw do
  resources :messages
  resources :users

  #API
  match "/newMess/:uid/:texte" => "api#newMess"
end
