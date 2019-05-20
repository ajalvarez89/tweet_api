class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all

    if @tweets.present?
      render json: tweets, status: :ok
    else
      render json: {error: "No data was found"}, status: :not_found
    end
  end

  def create
    @tweets = Tweet.new(tweet_params)
    if @tweets.save
      render json: tweets, status: :created
    else
      render json: tweets.erros, status: :unprocessable_entity   
    end
  end

  def update
    @tweets = Tweet.find(params[:id])

    if @tweets.save
      render json: tweets, status: :created
    else
      render json: tweets.erros, status: :unprocessable_entity   
    end

  end

  def destroy
    @tweets.destroy
  end

  private

  def tweet_params
      params.require(:tweet).permit(:user,:tweet_content)
  end
end
