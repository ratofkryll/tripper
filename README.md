Traveller (LHL Bootcamp Final Project)
================================
By Daniel Amiri-Fear, Gioanna Rheumer & Negar Amiri

Traveller is a collaborative trip-planning web application. It allows users to create trips, invite their friends to join and dynamically add itineraries and then attractions or notes to each itinerary. Users can also amend and delete intineraries or trips too.

## Screenshots
Invite a friend to collaborate on your trip:
If they're already a user, they will be automatically added and sent an email. Otherwise, they'll receive an email to tell them to join.
!["Invite a friend"](https://github.com/ratofkryll/tripper/blob/master/public/invite-friend.gif?raw=true)

Add an item to the itinerary and it will be automatically visible to anyone who's on the trip
!["Add an itinerary item"](https://github.com/ratofkryll/tripper/blob/master/public/add-item-to-trip.gif?raw=true)

## Getting Started

1. Install dependencies using the `bundle install` command.
2. Create PostgreSQL database manually.
3. Apply data into the application using `rails db:create`, `rails db:migrate` and `rails db:seed`.
4. Start the web server using the `rails s` command. The app will be served at <http://localhost:3000/>.
5. Go to <http://localhost:3000/> in your browser.

## Dependencies
  * Ruby 2.6.0
  * Rails 5.2.2
  * PostgreSQL
  * Faker
  * JQuery Rails
  * Sass
  * Uglifier
  * Coffee
  * Jbuilder
  * Redis
  * Bcrypt
  * Fontawesome
  * Bootsnap
  * Devise
  * Formtastic
  * Sendgrid API
  * Google Map API
