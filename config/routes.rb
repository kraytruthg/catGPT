Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/line/webhook' do
    body = request.body.read
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    events = client.parse_events_from(body)
    events.each { |event| handle_message(event) }
    head :ok
  end  
end
