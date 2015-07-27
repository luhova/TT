class TimeTable < ActiveRecord::Base
  attr_accessible :from, :time, :to, :transport

  validates :from, :time, :to, :transport, presence: true

  def self.search(search_from, search_to)
    TimeTable.where({from: search_from, to: search_to})
  end
end