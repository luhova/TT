require "rails_helper"

RSpec.describe TimeTablesController, :type => :controller do
  expect(assigns(:time_table)).to be_a_new(TimeTable)
end
