require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    
    erb :index
  end

  get '/articles' do
    @articles = Article.all
    
    erb :index
  end
  
  get '/articles/new' do
    
    erb :new
  end

  get '/articles/:id' do
    @article = Article.all.find_by(id: params[:id].to_i)
    !@article ? Article.create(params) : @article
    
    erb :show
  end

  get '/articles/:id/edit' do
    @this_article = Article.all.find_by(id: params[:id].to_i)
    
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.all.find_by(id: params[:id].to_i)
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    
    erb :'articles/@article.id'
  end

  delete '/articles/:id' do
    @article = Article.all.find_by(id: params[:id].to_i)
    @article.delete
    
    erb :show
  end
end