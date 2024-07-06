Feature: Tests on Globomantics Products API

  Background:
    * url 'http://localhost:8090/api/'
    Given path 'authenticate'
    And request '{"username": "admin", "password": "admin"}'
    And header Content-Type = 'application/json'
    When method Post
    Then status 200
    * def token = response.token
    * def productId = response[0].id
    * print token

  Scenario: Get all products
    Given path 'product'
    When method Get
    And status 200
    * match response[0].id == 1
    * print response

  Scenario: Create a product
    Given path 'product'
    And request '{"name":"Brownie Belt","description":"Leather","price":"100", "categoryId":"5", "inStock":true}'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + token
    When method post
    Then status 200
    * match response.name == 'Brownie Belt'
    * print response


    Scenario: Get a product by id
      Given path 'product', productId
      When method Get
      And status 200
      Then match response.name == 'Vintage Minature Car'
      * print response


