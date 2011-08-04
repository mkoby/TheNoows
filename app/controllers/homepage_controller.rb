class HomepageController < ApplicationController
  before_filter :first_time_visiting
  layout 'main'

  def home
    @items = Vote.includes(:news_item => [:source, :users]).paginate( :page => params[:page], :per_page => 15,
                                                                      :order => 'created_at DESC' )
  end

  def new
    @items = NewsItem.includes(:source, :users).paginate( :page => params[:page], :per_page => 15,
                                                          :order => 'published_at DESC' )
  end

  def category
  end

end

