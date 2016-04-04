class Seeds
  def airport_list
    [
      { name: "Murtala Muhammed International Airport", country: "Nigeria",
        city: "Lagos", code: "MF1" },
      { name: "Nnamdi Azikwe International Airport", country: "Nigeria",
        city: "Abuja", code: "MF2" },
      { name: "Dubai International Airport", country: "Dubai", city: "Garhoud",
        code: "MF10" },
      { name: "Manchester Airport", country: "England", city: "Manchester",
        code: "MF4" },
      { name: "Amsterdam Airport Schiphol", country: "Holland",
        city: "Haarlemmermeer", code: "MF16" }
    ]
  end

  def create_airport
    airport_list.each { |airport| Airport.create(airport) }
  end

  def create_flight
    Flight.create(dept_date: "2016-04-23",
                  dept_time: "6.00am",
                  airline: "Qatar Airways",
                  cost: 7000,
                  from_id: 5,
                  to_id: 3,
                  flight_code: 321
                 )
  end
end
