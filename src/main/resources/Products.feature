Feature: Tests on Globomantics Products API

  Background:
    * url 'http://localhost:8090/api/'

  Scenario: Get all products
    Given path 'product'
    When method Get
    And status 200
    * print response
    Then match response == '
