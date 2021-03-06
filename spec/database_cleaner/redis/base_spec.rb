require 'spec_helper'
require 'database_cleaner/redis/base'
require 'database_cleaner/shared_strategy_spec'

module DatabaseCleaner
  describe Redis do
    it { should respond_to(:available_strategies) }
  end

  module Redis
    class ExampleStrategy
      include ::DatabaseCleaner::Redis::Base
    end

    describe ExampleStrategy do

      it_should_behave_like "a generic strategy"
      it { should respond_to(:db) }
      it { should respond_to(:db=) }

      it "should store my describe db" do
        url = 'redis://localhost:6379/2'
        subject.db = 'redis://localhost:6379/2'
        subject.db.should == url
      end

      it "should default to :default" do
        subject.db.should == :default
      end
    end
  end
end
