require 'rubygems'
require 'rspec'
require 'rspec/autorun'
require File.dirname(__FILE__) + "/../lib/sample_repo"

describe SampleRepo do

  it "should create a sample git repo with various build pipeline tags" do
    repo_path = File.dirname(File.expand_path(__FILE__)) + "/sample_repo"

    repo = SampleRepo.new
    repo.create(repo_path)

    File.directory?(repo_path).should eql(true)
  end
   
end
