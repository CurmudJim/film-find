require 'sinatra'
require 'sinatra/reloader' if development?
require 'pony'
require './themoviedb.rb'


def send_message

    Pony.mail({
      :from => params[:name] + "<" + params[:email] + ">",
      :to => 'jgarvey86@gmail.com',
      :subject => params[:name] + " has contacted you",
      :body => params[:message],
      :via => :smtp,
      :via_options => {
        :address              => 'smtp.gmail.com',
        :port                 => '587',
        :enable_starttls_auto => true,
        :user_name            => 'jgarvey86',
        :password             => 'rwlnzgeahrbmzbtz',
        :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
        :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
      }
    })

end


get '/' do
  @movies = ["Enter a movie."]
  erb :index
end

post '/' do
  @movies = movie_search(params[:movie])
  @titles = @movies[0]
  @ids = @movies[1]
  @overviews = @movies[2]
  @years = @movies[3]
  @posters = @movies[4]

  erb :index
end

get '/contact' do
  erb :contact
end

post '/contact' do
  send_message
  redirect to('/')
end
