class TimeTable < ActiveRecord::Base
  attr_accessible :from, :time, :to, :sort
end
