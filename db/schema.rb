
ActiveRecord::Schema.define(version: 20_160_319_215_832) do
  create_table 'airlines', force: :cascade do |t|
    t.string   'name'
    t.string   'code'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'airplanes', force: :cascade do |t|
    t.string   'name'
    t.string   'code'
    t.integer  'airline_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer  'seats'
  end

  create_table 'airports', force: :cascade do |t|
    t.string   'name'
    t.string   'city'
    t.string   'country'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'bookings', force: :cascade do |t|
    t.integer  'user_id'
    t.integer  'flight_id'
    t.integer  'no_of_passenger'
    t.integer  'confirmation_code'
    t.datetime 'created_at',        null: false
    t.datetime 'updated_at',        null: false
  end

  create_table 'flights', force: :cascade do |t|
    t.integer  'from_id'
    t.integer  'to_id'
    t.date     'dept_date'
    t.string   'dept_time'
    t.string   'flight_code'
    t.string   'price'
    t.integer  'airplane_id'
    t.string   'duration'
    t.datetime 'created_at',  null: false
    t.datetime 'updated_at',  null: false
  end

  create_table 'passengers', force: :cascade do |t|
    t.string   'name'
    t.string   'email'
    t.integer  'booking_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string   'name'
    t.string   'email'
    t.string   'provider'
    t.string   'user_code'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
