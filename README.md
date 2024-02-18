# README

This project contains the Wellster telemedicine app. This is a Ruby on Rails 7 project.

The api contains endpoints to:
1. list of patients that could be assigned to doctor
2. list of a doctor patients
3. Doctors  can assign themselves to patients
4. list of patients without doctors


  ```sh
 my_patients GET    /doctors/:id/my_patients(.:format)        doctors#my_patients
 available_patients GET    /doctors/:id/available_patients(.:format) doctors#available_patients
 assign_patient POST   /doctors/:id/assign_patient(.:format)     doctors#assign_patient
 available_patients GET    /patients/available_patients(.:format)    patients#available_patients
  ```

You need:
* Docker & docker-compose
* Ruby 3.3.0

## Build the environment

  ```sh
  docker-compose build
  ```

## Database creation

  ```sh
  docker-compose run backend bundle exec rake db:setup
  ```

## Start the environment

  ```sh
  docker-compose up
  ```

## Working with the Rails container

  ```sh
  docker-compose exec backend bash
  ```

## Tests

  ```sh
  rspec
  ```
