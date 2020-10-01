
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

 get '/articles' do
    @articles = Article.all
    erb :index
  end 


  get '/articles/new' do
    erb :new
  end
  
  post '/articles' do
    article = Article.create(params)
    redirect "/articles/#{article.id}"
  end

  get '/articles/:id' do
    id = params[:id]
    @article = Article.find_by_id(id)
    erb :show
  end

  get '/articles/:id/edit' do
     
      @article = Article.find_by_id(params[:id])
      erb :edit
    end

  patch '/articles/:id' do 
    # binding.pry
    @article = Article.find_by_id(params[:id])
    @article.update(params)
    redirect "/articles/#{@article.id}"
  end

  

end
