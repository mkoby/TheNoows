class HomepageController < ApplicationController
  layout 'main'

  def home
    @items = Vote.paginate( :page => params[:page], :per_page => 25,
                            :order => 'created_at DESC' )
  end

  def new
    @items = NewsItem.paginate( :page => params[:page], :per_page => 25,
                            :order => 'created_at DESC' )
  end

  def category
  end

end
