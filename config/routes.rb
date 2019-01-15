Rails.application.routes.draw do
  root to: 'articles#index'
  resources :articles
  #I believe this is referring to the Database. How do I know? Because the word "articles" is plural. Database names are always plural. 
end
