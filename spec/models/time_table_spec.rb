require 'rails_helper'

RSpec.describe TimeTable, :type => :model do

  it "is invalid without a starting point" do
    expect{ FactoryGirl.create(:time_table, from: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "is invalid without an ending point" do
    expect{ FactoryGirl.create(:time_table, to: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "is invalid without time of departure" do
    expect{ FactoryGirl.create(:time_table, time: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "is invalid without type of transport" do
    expect { FactoryGirl.create(:time_table, transport: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  let!(:tt) { FactoryGirl.create(:time_table, from: 'Sofia', to: 'Samokov')}

  describe '.search' do
    it "returns the right time-table" do
      expect(TimeTable.find_by_from_and_to('Sofia', 'Samokov')).to eq(tt)
    end
  end

end
