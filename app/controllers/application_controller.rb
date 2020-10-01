
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get "/articles" do
    @articles = Article.all
      erb :index
    end

  get "/articles/new" do
    @article = Article.new
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    erb :show
  end

  post '/articles' do 
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}" ##this is where we make new posts that save to our database!
  end

  get '/articles/:id/edit' do
    @article = Article.find_by_id(params[:id])
    erb :edit
  end

  patch '/articles/:id' do 
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{@article.id}"
  end

  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end

end
