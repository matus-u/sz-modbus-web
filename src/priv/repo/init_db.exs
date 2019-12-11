# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Szmod.Repo.insert!(%Szmod.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Szmod.Repo
alias Szmod.Sensors
alias Szmod.Characteristics

Repo.insert_all(Sensors.SensorType,
[%{name: "WIND SENSOR" },
 %{name: "METEO SENSOR" },
 %{name: "GPS SENSOR" }])

Repo.insert_all(Characteristics.CharacteristicType,
[%{name: "Unknown", uuid: 0 },
 %{name: "Wind direction", uuid: 1 },
 %{name: "Wind speed", uuid: 2  },
 %{name: "CO2 concentration", uuid: 3  },
 %{name: "Atmosphere pressure", uuid: 4  },
 %{name: "Temperature", uuid: 5  },
 %{name: "Humidity", uuid: 6  },
 %{name: "Dew point", uuid: 7  },
 %{name: "Sun elevation", uuid: 8  },
 %{name: "Sun azimuth", uuid: 9 }])
