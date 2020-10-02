
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

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find_by_id(params[:id])

    erb :show
  end

  post '/articles' do
    article = Article.new(params)
    article.save
    redirect "/articles/#{article.id}"
  end

  get '/articles/:id/edit' do
    @article = Article.find_by_id(params[:id])

    erb :edit
  end

  patch '/articles/:id' do
    article = Article.find_by(id: params[:id])
    params.delete("_method")
    article.update(params)

    redirect "/articles/#{article.id}"
  end




  delete '/articles/:id' do
    # id = params[:id]
    # Article.destroy(id)
    # redirect to '/articles'
    article = Article.find_by(id: params[:id])
    article.destroy
    @articles = Article.all

    erb :index
  end



end
