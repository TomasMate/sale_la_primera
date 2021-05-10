Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about' #en la URL el /about solicita una accion GET, y con to: definimos que mande este accion 
                                 # al controlador pages_controller (solo pongo pages y rails entiende que es ese) y a la 
                                 # accion about del controlador (hay que definirla). Esta acción por defecto va a buscar la 
                                 # pagina que se llame como la accion "about". Si no esta me tira error, tengo que crearla.


  resources :articles            #resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]

 end
