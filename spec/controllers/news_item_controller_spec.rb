require 'spec_helper'

describe NewsItemController do

  describe "GET 'list'" do
    it "should be successful" do
      get 'list'
      response.should be_success
    end
  end

  describe "GET 'vote_up'" do
    it "should be successful" do
      get 'vote_up'
      response.should be_success
    end
  end

end
