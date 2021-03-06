require 'faker'

FactoryGirl.define do
  factory :time_table do |f|
    f.from { Faker::Address.city }
    f.to   { Faker::Address.city }
    f.time { Faker::Time.between(DateTime.now - 1, DateTime.now) }
    f.transport { Faker::Lorem.word }
  end

  factory :invalid_time_table, parent: :time_table do |f|
    f.from nil
  end
end
