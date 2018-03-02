#REDUX-1252
@login
Feature: Archive Search login

  Scenario: As user with correct credentials can login
   Given a user exists in Redux
   When user login on archive search
   And user accepts terms and conditons
   Then user can see the main page

  Scenario: AS user login incorrect username
    Given a user exists in Redux
    When user login with incorrect username
    Then error message is displayed as "Error: Username or password is incorrect."

  Scenario: AS user login incorrect password
    Given a user exists in Redux
    When user login with incorrect password
    Then error message is displayed as "Error: Username or password is incorrect."

  Scenario: Redux login option and enter a username longer than 50 characters
    When user login with username longer than 50 characters
    Then error message is displayed as "Error: Username or password is invalid length."

  Scenario: Redux login option and enter a password longer than 50 characters
    When user login with password longer than 50 characters
    Then error message is displayed as "Error: Username or password is invalid length."

  Scenario: Redux login option and enter a username shorter than 3 characters
    When user login with username shorter than 3 characters
    Then error message is displayed as "Error: Username or password is incorrect."

  Scenario: Redux login option and enter a password shorter than 8 characters
    When user login with password shorter than 8 characters
    Then error message is displayed as "Error: Username or password is incorrect."

  Scenario: Redux login with username containing characters other than letters and numbers.
    When user login with username with special characters
    Then error message is displayed as "Error: Username or password is incorrect."

#REDUX-1313
  Scenario: A user registers on Redux but do not complete email validation
    Given a user exists in Redux without email validation
    When user login on archive search
    Then error message should include "We could not use your Redux credentials to login to Archive Search."

  Scenario: An expired Redux user tries to login on AS
    Given an expired user exists in Redux
    When user login on archive search
    Then error message should include "We could not use your Redux credentials to login to Archive Search."
