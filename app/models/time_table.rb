class TimeTable < ActiveRecord::Base
  attr_accessible :from, :time, :to, :transport
end
