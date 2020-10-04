
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
    @article = Article.create(params)
    id = @article.id.to_s

    redirect '/articles/' + "#{id}"
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find_by_id(params[:id])

    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find_by_id(params[:id])

    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    @article.update(params[:article])
    @article.save

    redirect "/articles/#{@article.id}"

  end

  delete '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    @article.destroy
  end





end
