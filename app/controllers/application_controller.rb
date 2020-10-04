
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all 

    erb :index
  end

  post '/articles' do
    @article = Article.new(params[:title], params[:content])
    
    erb :new
  end

  # get '/articles/:id' do
  #   @article = params[:id]

  #   erb :show

  # end



end
