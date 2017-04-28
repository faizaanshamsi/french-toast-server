# FrenchToastServer

## About

- Background
  - [UniversalHub.com](http://www.universalhub.com/) is a popular local news blog.
  - When there is the threat of a snowstorm, people traditionally rush to the grocery store to buy necessities like bread, milk and eggs— which happen to the ingredients for french toast.
  - [Universal Hub reports a French Toast Alert rating](http://www.universalhub.com/french-toast) based on how likely we will see a storm/how crazed people are feeling about it.
  - UniversalHub has an [API](http://www.universalhub.com/toast.xml) that returns the current French Toast Alert Level.


- Backend
  - We’ll hit Universal Hub’s API once an hour and save the French Toast status to our database. This way, we can look back on trends.


- Website
  - Current French Toast alert level and statistics will be displayed on the website— the front end will be built using React or Elm. Data visualizations will be built with D3.js.
  - Potential text notification sign up(?).


- Alexa
  - Example utterance: "Alexa, what is the current French Toast Alert level?"
  - Example reply: "According to UniversalHub.com, the current French Toast Alert level is LOW. Last updated 4/24/17 at 1pm."



## To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
