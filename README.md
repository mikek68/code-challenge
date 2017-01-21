# Code Challenge

This specification depicts an application that allows users to book hotel rooms. An administrator should have the ability to create a hotel with a series of rooms belonging to it, and each room should have the ability to be assigned a room type (e.g. “Suite”). From here, a user should be able to sign in and see a dashboard of any bookings they might have made in the past, or book one of the hotel rooms for a set number of days in a form. The room should become unavailable to other users while it is occupied.

**Challenge stories:**

1. As a user, I want the ability to sign up / sign in to the application so that I have my own account registered with the application.
  1. Acceptance Criteria
    1. Use of the **devise** gem for user registration.
2. As a user, I want the ability to view all of my bookings at sign on so that I have a sense of how many hotel bookings I have at a glance.
  1. Acceptance Criteria
    1. The “Bookings” dashboard should be the root path at user sign on
    2. Calendar view
    3. List view
3. As a user, I want the ability to create a hotel booking in a form. 
  1. Acceptance Criteria
    1. Fields
      1. Hotel selection
      2. Room Selection (including the display of the room type)
      3. Description of Stay
      4. Date Start / End (including availability indicator) **(Accomplished by filtering list of Rooms when Check In / Out dates are modified or a different Hotel is selected)**
4. As an admin, I want the ability to view and manage a list of resources in the system.
  1. Acceptance Criteria
    1.  Use of the  **Active Admin** gem for administration
    2. “Hotel” Resource list/creation/modification
      1. Include room count using a counter cache
    3. “Room” Resource list/creation/modification
      1. Rooms should be associated with a hotel
      2. Rooms should have a “Room Type” assigned to them
    4. “Room Type” Resource list/creation/modification
    5. “Booking” Resource list (optional: modification)

*Optional:* Stripe API Integration (“Test” environment)
  1. As a user I want the ability to be charged for my “Booking” based on a nightly rate.
    1. Acceptance Criteria:
      1. Use of the  **stripe**  gem to integrate with the Stripe API
      2. Pricing configurable based on “Room Type”
      3. User is charged for a “Booking” based on the total number of nights selected
      4. Total charges are attached to a “Booking” record

Bonus points for not using Twitter Bootstrap or any other CSS framework (We want to see how you structure your CSS).

We are looking for a simple, clean, elegant design, tests and all round understanding of the full stack e.g. Ruby, Rails, CSS (or SASS), HTML, JavaScript (or CoffeeScript).

**Design:**  Surprise us.

**Version Requirements:**

Ruby version: >= 2.3.0

Rails version: >= 4.0.0

**Persistence:**  PostgreSQL

**Testing:**  RSpec

**Timeframe:**  3 days

**Review Submission:**
* Source: Commit your project into a repo on GitHub
* Hosting: Project to be hosted on AWS or Heroku

Deployed to Heroku at: https://young-plateau-18582.herokuapp.com
