# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FrenchToastServer.Repo.insert!(%FrenchToastServer.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias FrenchToastServer.Repo
alias FrenchToastServer.Data.Level

Repo.insert!(%Level{
                    name: "low",
                    description: "No storm predicted. Harvey Leonard sighs and looks dour on the evening news. Go about your daily business but consider buying second refrigerator for basement, diesel generator. Good time to replenish stocks of maple syrup, cinnamon.",
                    color: "green"
                   }
            )
Repo.insert!(%Level{
                    name: "guarded",
                    description: "Light snow predicted. Subtle grin appears on Harvey Leonard's face. Check car fuel gauge, memorize quickest route to emergency supermarket should conditions change.",
                    color: "blue"
                    }
            )
Repo.insert!(%Level{
                    name: "elevated",
                    description: "Moderate, plowable snow predicted. Harvey Leonard openly smiles during report. Empty your trunk to make room for milk, eggs and bread. Clear space in refrigerator and head to store for an extra gallon of milk, a spare dozen eggs and a new loaf of bread.",
                    color: "yellow"
                   }
            )
Repo.insert!(%Level{
                    name: "high",
                    description: "Heavy snow predicted. Harvey Leonard breaks into huge grin, can't keep his hands off the weather map. Proceed at speed limit before snow starts to nearest supermarket to pick up two gallons of milk, a couple dozen eggs and two loaves of bread - per person in household.",
                    color: "orange"
                   }
            )
Repo.insert!(%Level{
                    name: "severe",
                    description: "Nor'easter predicted. This is it, people, THE BIG ONE. Harvey Leonard makes repeated references to the Blizzard of '78. RUSH to emergency supermarket NOW for multiple gallons of milk, cartons of eggs and loaves of bread. IGNORE cries of little old lady you've just trampled in mad rush to get last gallon of milk. Place pets in basement for use as emergency food supply if needed.",
                    color: "red"
                   }
            )
