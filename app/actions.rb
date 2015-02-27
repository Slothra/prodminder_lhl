get '/' do
  slim :index
end



get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass(:"stylesheets/#{params[:name]}", Compass.sass_engine_options )
end

get '/dashboard' do
  slim :dashboard

end

not_found do
  redirect '/404.html'
end
