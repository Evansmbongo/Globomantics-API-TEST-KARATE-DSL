Feature: Tests on Globomantics Categories API

  Background:
    * url 'http://localhost:8090/api/'
    Given path 'authenticate'
    And request '{"username": "admin", "password": "admin"}'
    And header Content-Type = 'application/json'
    When method post
    Then status 200
    * def token = response.token
    * print 'Value of the token: ' + token

  Scenario: Get all categories
    Given path 'category'
    When method GET
    Then status 200
    * print response

  Scenario: Create a category
    Given path 'category'
    And header Authorization = 'Bearer ' + token
    And header Content-Type = 'application/json'
    And request '{"name": "Evans is sad"}'
    When method post
    Then status 200
    * print response

  Scenario: Create and get category
    * def categoryName = 'Cat is coming'
    Given path 'category'
    And header Authorization = 'Bearer ' + token
    And header Content-Type = 'application/json'
    And request '{"name": "' + categoryName + '"}'
    When method post
    Then status 200
    And match response.name == categoryName

    * def categoryId = response.id
    Given path 'category', categoryId
    When method get
    Then status 200
    And match response.id == categoryId

  Scenario: Update a category
    Given path 'category', 5
    And header Authorization = 'Bearer ' + token
    And header Content-Type = 'application/json'
    And request '{"name": "Evans is happyyyy"}'
    When method put
    Then status 200
    * print response
    * match response.name == "Evans is happyyyy"

  Scenario: Delete a category
    Given path 'category', 11
    And header Authorization = 'Bearer ' + token
    And header Content-Type = 'application/json'
    When method delete
    Then status 200
    * print response
    * match response == 'Category: Cat is coming deleted successfully'




