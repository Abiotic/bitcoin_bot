BitcoinBot::Application.routes.draw do

  root to: 'panel#index', as: :root_path

  # panel
  match '/panel' => 'panel#index', as: :panel, via: :get

end
