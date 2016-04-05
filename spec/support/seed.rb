class Seeds
  def airport_list
    [
      { name: "Murtala Muhammed International Airport", country: "Nigeria",
        city: "Lagos" },
      { name: "Nnamdi Azikwe International Airport", country: "Nigeria",
        city: "Abuja" },
      { name: "Dubai International Airport", country: "Dubai", city: "Garhoud"
       }
    ]
  end

  def create_airports
    @airports_id = []
    airport_list.each { |airport| @airports_id << Airport.create(airport).id }
  end

  def create_flight

    airline_list = [
      { name: "Qatar Airways", code: "QTA" },
      { name: "Delta Airways", code: "DTA" },
      { name: "Virgin Atlantic", code: "VGA" }
    ]
    airline_id = []
    airline_list.each { |airline| airline_id << Airline.create(airline).id }
    airplane_list = [
      { name: "Lightweight Fighter", code: "MiG-21", seats: "120",
        airline_id: airline_id.sample },
      { name: "Waco 10", code: "Wac-10", seats: "130",
        airline_id: airline_id.sample }
      ]
    airplane_id = []
    airplane_list.each { |airplane| airplane_id << Airplane.create(airplane).id }

      flight = Flight.new
      flight.dept_date = Time.at(Time.now.to_i + (24 * 60 * 60 * 2 ))
      flight.dept_time =["6.00am", "11:00am", "1:00pm", "2:30pm", "5:00pm",
                        "11:00pm"].sample
      flight.airplane_id = airplane_id.sample
      flight.price =  [158_000, 200_000, 260_000, 145_000].sample
      flight.from_id = @airports_id.first
      flight.to_id = @airports_id.last
      flight.flight_code = "AS#{Random.new.rand(100)}"
      flight.duration = (1..17).to_a.sample
      flight.save

      second_flight = Flight.new
      second_flight.dept_date = Time.at(Time.now.to_i + (24 * 60 * 60 * 2 ))
      second_flight.dept_time =["6.00am", "11:00am", "1:00pm", "2:30pm", "5:00pm",
                        "11:00pm"].sample
      second_flight.airplane_id = airplane_id.sample
      second_flight.price =  [158_000, 200_000, 260_000, 145_000].sample
      second_flight.from_id = @airports_id.first
      second_flight.to_id = @airports_id.second
      second_flight.flight_code = "AS#{Random.new.rand(100)}"
      second_flight.duration = (1..17).to_a.sample
      second_flight.save

      third_flight = Flight.new
      third_flight.dept_date = "2016-04-03"
      third_flight.dept_time =["6.00am", "11:00am", "1:00pm", "2:30pm", "5:00pm",
                        "11:00pm"].sample
      third_flight.airplane_id = airplane_id.sample
      third_flight.price =  [158_000, 200_000, 260_000, 145_000].sample
      third_flight.from_id = @airports_id.first
      third_flight.to_id = @airports_id.second
      third_flight.flight_code = "AS#{Random.new.rand(100)}"
      third_flight.duration = (1..17).to_a.sample
      third_flight.save
    end

  end
