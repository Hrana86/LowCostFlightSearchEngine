# LowCostFlightSearchEngine
Simple app that consumes the amadeus flight API

Simple .NET 5.0 application with basic functionality for retrieving Low-cost flights from Amadeus API https://developers.amadeus.com/self-service/category/air/api-doc/flight-offers-search.

## Getting started
1. Kreate a local database using script "Kreiranje_baze.sql" located in LowCostFlightSearchEngine project root
2. Build and run WebScrapper
3. Build and run LowCostFlightSearchEngine

### Overview
#### Kreiranje_baze.sql
SQL script used to create a database in witch we will store IATA codes and search history.

#### WebScrapper 
C# web scrapper that targets wikipedia link: https://en.wikipedia.org/wiki/List_of_airports_by_IATA_code:_A, it goes through each letter of the alphabet and downloads IATA codest into our database

#### Low Cost Flight Search Engine
Query amadeus API using parameters:
 - Origin
 - Destination
 - Departure time
 - Return time (optional)
 - Currency
 - Number of passangers
  
 It return a list of available flights using specified parameters.
 Every search is saved to a database so it calls the API only once for a given set of search parameters.
