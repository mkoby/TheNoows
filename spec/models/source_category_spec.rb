require 'spec_helper'

describe SourceCategory do
    subject { Factory(:source_category, :name => 'Top Stories', :description => 'Top news stories') }
    its(:name) { should == 'Top Stories' }
    its(:description) { should == 'Top news stories' }
end
