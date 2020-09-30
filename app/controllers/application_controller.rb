
require_relative '../../config/environment'

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

  post '/articles' do
    @article = Article.create(params)
    # binding.pry
    redirect "/articles/#{Article.last.id}" #Can't use single quotes here due to the variable
  end

  get '/articles' do
    @articles = Article.all

    erb :index
  end

  get '/articles/:id' do
    @article = Article.all.find_by_id(params[:id])

    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.all.find_by_id(params[:id])
    # binding.pry
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.all.find_by_id(params[:id])
    params.delete("_method")
    if @article.update(params)
      redirect "/articles/#{@article.id}"
    else
      redirect "articles/new"
    end
  end

  delete '/articles/:id' do
    @article = Article.all.find_by_id(params[:id])
    @article.destroy
  end

end
