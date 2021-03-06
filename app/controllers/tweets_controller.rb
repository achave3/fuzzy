class TweetsController < ApplicationController
  before_filter :authenticate_user!
  #This makes you sign in/up before you can see any view
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

 
  def index
    @tweets = Tweet.all
  end
# This

# Two steps to make a tweet. 1) form to fill out for the tweet- 'new' and 2) creates that tweet- 'create'

#Step 1- form to fill out for new tweet
  def new
    @tweet = Tweet.new
    #this creates an empty tweet object in the 'new' tweet view that we can fill in with data
  end

#Step 2- creates that new tweet
def create
  @tweet = Tweet.new(tweet_params)
  
  respond_to do |format|
    if @tweet.save
      format.html{redirect_to @tweet, 
                  notice: 'You made a tweet!'}
    else
      format.html {render :new}
      #renders the new view if the tweet doesn't save- gives you a new blank form to fill out
    end
  end
end
  
  

  def show
    
  end

  def edit
   
  end
  
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html {redirect_to @tweet, 
                                  notice: 'Your tweet has been updated.'}
                                  
      else
        format.html {render :edit}
      end
    end
  end
  
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html {redirect_to tweets_url, notice: 'Tweet Destroyed!'}
    end  
  end

  
  private
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
  
  
  
  private
    def tweet_params
      params.require(:tweet).permit(:message, :user_id)
    end
  
  
end
