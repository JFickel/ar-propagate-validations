get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  @event = Event.new
  erb :event_new
end

post '/events/create' do
  @event = Event.new(params[:events]) 
  if @event.save
    redirect '/' 
  else 
    erb :event_new
  end
end
