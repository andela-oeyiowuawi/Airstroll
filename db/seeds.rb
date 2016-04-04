
Airport.destroy_all
Flight.destroy_all
airports_list = [
  { name: "Murtala Muhammed International Airport",
    country: "Nigeria", city: "Lagos" },
  { name: "Nnamdi Azikwe International Airport",
    country: "Nigeria", city: "Abuja" },
  { name: "John Lennon Airport", country: "England",
    city: "Liverpool" },
  { name: "Manchester Airport", country: "England",
    city: "Manchester" },
  { name: "Gatwick Airport", country: "England",
    city: "West Sussex" },
  { name: "Heathrow Airport", country: "England",
    city: "London" },
  { name: "Los Angeles International Airport", country: "US",
    city: "Los Angeles" },
  { name: "San Francisco International Airport", country: "US",
    city: "San Francisco" },
  { name: "Indira Gandhi International Airport", country: "India",
    city: "Delhi" },
  { name: "Dubai International Airport", country: "Dubai",
    city: "Garhoud" },
  { name: "Beijing Capital International Airport", country: "China",
    city: "Beijing" },
  { name: "Singapore Changi Airport", country: "Singapore",
    city: "Changi" },
  { name: "Istanbul Atatürk Airport", country: "Turkey",
    city: "Istanbul" },
  { name: "Frankfurt Airport", country: "Germany",
    city: "Frankfurt" },
  { name: "Amsterdam Airport Schiphol", country: "Holland",
    city: "Haarlemmermeer" }
]

airports_id = []
airports_list.each { |airport| airports_id << Airport.create(airport).id }

airline_list = [
  { name: "Qatar Airways", code: "QTA" },
  { name: "Delta Airways", code: "DTA" },
  { name: "Virgin Atlantic", code: "VGA" },
  { name: "Emirates", code: "EMR" },
  { name: "Turkish Airline", code: "TKA" },
  { name: "British Airways", code: "ETH" },
  { name: "Arik Airway", code: "ARA" },
  { name: "Air  France", code: "ARA" }
]
airline_id = []
airline_list.each { |airline| airline_id << Airline.create(airline).id }
airplane_list = [
  { name: "Lightweight Fighter", code: "MiG-21", seats: "120",
    airline_id: airline_id.sample },
  { name: "Waco 10", code: "Wac-10", seats: "130",
    airline_id: airline_id.sample },
  { name: "Ercoupe", code: "Erc-77", seats: "150",
    airline_id: airline_id.sample },
  { name: "Liberator", code: "B-24", seats: "100",
    airline_id: airline_id.sample },
  { name: "Mitsubishi Zero", code: "Mit-0", seats: "110",
    airline_id: airline_id.sample },
  { name: "Cessna Corvalis", code: "Cc-23", seats: "120",
    airline_id: airline_id.sample },
  { name: "Boeing", code: "B-787", seats: "154",
    airline_id: airline_id.sample },
  { name: "Silvaire", code: "Ls-930", seats: "250",
    airline_id: airline_id.sample },
  { name: "Silvaire", code: "Ls-930", seats: "300",
    airline_id: airline_id.sample },
  { name: " DiamondStar", code: "Da-40", seats: "260",
    airline_id: airline_id.sample },
  { name: " Pilatus", code: "Pc-12", seats: "200",
    airline_id: airline_id.sample },
  { name: " Hawker", code: "Hi-320", seats: "250",
    airline_id: airline_id.sample },
  { name: " Blackbird", code: "sr-71", seats: "200",
    airline_id: airline_id.sample }

]
airplane_id = []
airplane_list.each { |airplane| airplane_id << Airplane.create(airplane).id }

def set_airports(airports_id)
  from_id = airports_id.sample
  to_id = airports_id.sample
  to_id = airports_id.sample if from_id == to_id
  [from_id, to_id]
end

def set_flight_time
  dept_time = Time.at(Time.now.to_i + (24 * 60 * 60 * Random.new.rand(30)))
  time_of_flight = ["6.00am", "11:00am", "1:00pm", "2:30pm", "5:00pm",
                    "11:00pm"]
  duration = (1..17).to_a.sample
  flight_time = time_of_flight.sample
  [dept_time, flight_time, duration]
end

def set_flights_info(airports_id, airplane_id)
  cost = [158_000, 200_000, 260_000, 145_000, 250_000, 300_000, 178_000]
  airplane = airplane_id.sample
  price =  cost.sample
  flight_code = "AS#{Random.new.rand(100)}"
  locations = set_airports(airports_id)
  flight_datetime_and_duration = set_flight_time
  { dept_date: flight_datetime_and_duration[0],
    dept_time: flight_datetime_and_duration[1], airplane_id: airplane,
    price: price, from_id: locations[0], to_id: locations[1],
    flight_code: flight_code, duration: flight_datetime_and_duration[2] }
end

100.times do
  Flight.create(set_flights_info(airports_id, airplane_id))
end
