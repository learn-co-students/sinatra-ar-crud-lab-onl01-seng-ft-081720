
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
    erb :"articles/index"
  end
  
  get '/articles/new' do
    erb :"articles/new"
  end

  
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :"articles/show"
  end
  
  post '/articles' do
    # Article.create(params)
    article = Article.new(params)
    if article.save
      redirect "/articles/#{article.id}"
    else
      redirect "articles/new"
    end

  end


  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :"articles/edit"
  end

  patch '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    params.delete("_method")
    if @article.update(params)
        redirect "/articles/#{@article.id}"
    else
        redirect "articles/new"
    end
    # id = params["id"]
    # new_params = {}
    # old_article = Article.find(id)
    # new_params[:name] = params["name"]
    # new_params[:content] = params["content"]
    # old_article.update(new_params)

    # redirect "/articles/#{id}"
  end

  delete '/articles/:id' do
    @article = Article.find(params["id"])
    @article.delete
    erb :"articles/show"
  end

end
