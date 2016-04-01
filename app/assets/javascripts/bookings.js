
  function passenger_calc(action)
  {
    if (action  == "add")
    {
      pass = parseInt($(".pass").text().match(/\d+/)) + 1;
    }
    else if (action == "subtract")
    {
      pass = parseInt($(".pass").text().match(/\d+/)) - 1;
    }
    $(".pass").text("Number of Passenger(s): " + pass);
    $(".no_of_pass").val(pass);
  }
