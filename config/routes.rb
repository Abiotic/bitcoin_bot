BitcoinBot::Application.routes.draw do

  root to: 'panel#index', as: :root_path

  # panel
  match '/panel' => 'panel#index', as: :panel, via: :get

  match '/update_currency_graph' => 'panel#update_currency_graph', as: :update_currency_graph, via: :post, defaults: { format: :json }

end
