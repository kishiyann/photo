# frozen_string_literal: true

class TweetsController < ApplicationController
  before_action :move_to_index, except: %i[index show search]

  def index
    if params[:category_id]
      @tweets = Tweet.where(category_id: params[:category_id]).order('created_at DESC').page(params[:page]).per(15)
      render action: 'index'
    else
      @tweets = Tweet.includes(:user).order('created_at DESC').page(params[:page]).per(15)
    end
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      redirect_to action: 'index', notice: '投稿できました'
    else
      render 'new'
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: 'index'
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def search
    @tweets = Tweet.search(params[:keyword])
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :category_id, :image, :text).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
