
require_relative '../../config/environment'
#require_relative "../models/article.rb"

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
   
  get '/articles/new' do 
    erb :new
   end 
   
   post "/articles" do
    @new_article = Article.create(params)
  
    redirect '/articles'
   end 
  
  get "/articles" do 
   @articles = Article.all 
   erb :index 
  
  end 
  get "/articles/:id" do 
    @article = Article.find(params[:id])
    erb :show
  end

end
