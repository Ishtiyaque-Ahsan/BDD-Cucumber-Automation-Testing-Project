Feature: Booking Page UI and Functional Validation

@success
Scenario: Submit form with all valid data
	Given User launches the browser and opens the cab booking page
	When User fills the form with valid details:
	| Name     | Phone      | Email         | Trip | Cab  | CabType | Date       | Time  | Passenger | TripType |
	| Riyanko | 9903793252 | riyanko@test.com | long | Mini | AC      | 2025-07-28 | 09:30 | 2         | oneway   |
	And User clicks on Book Now button
	Then Booking confirmation message "Your Booking has been Confirmed" should be displayed

@errordetected
Scenario: Submit form with empty name
	Given User launches the browser and opens the cab booking page
	When User fills the form with valid details:
	| Name | Phone      | Email         | Trip | Cab  | CabType | Date       | Time  | Passenger | TripType |
	|      | 9903793252 | riyanko@test.com | long | Mini | AC      | 2025-07-28 | 09:30 | 2         | oneway |
	And User clicks on Book Now button
	Then Error message "Please enter the name" should be shown under Name field

@knownbug
Scenario: Error message for invalid data should be displayed under "<Field>" field 
	Given User launches the browser and opens the cab booking page
	When User fills the form with valid details:
	| Name   | Phone      | Email        | Trip   | Cab   | CabType   | Date       | Time   | Passenger   | TripType   |
	| <Name> | <Phone>    | <Email>      | <Trip> | <Cab> | <CabType> | <Date>     | <Time> | <Passenger> | <TripType> |
	And User clicks on Book Now button
	Then Error message "<ExpectedError>" should be shown under "<Field>" field
	
Examples:
| Name  | Phone      | Email          | Trip | Cab     | CabType | Date       | Time     | Passenger | TripType | Field       | ExpectedError |
| 12345 | 9903793252 | valid@mail.com | long | Mini    | AC      | 2025-07-30 | 09:30    | 2         | oneway   | name        | Please enter a valid name |
| Madhav | 9903793252 | testmail.com   | long | Mini    | AC      | 2025-07-30 | 09:30    | 2         | oneway   | email       | Please enter a valid email |
| Madhav | consumer   | valid@mail.com | long | Mini    | AC      | 2025-07-30 | 09:30    | 2         | oneway   | phone       | Please enter a valid phone number |
| Madhav | 9903793252 | valid@mail.com | long | Mini    | AC      | 2025-07-30 | 25:67:92 | 2         | oneway   | pickup time | Please enter a valid pickup time  |
	
@errordetected
Scenario: Submit form with empty trip type
	Given User launches the browser and opens the cab booking page
	When User fills the form with valid details:
	| Name  | Phone      | Email          | Trip | Cab  | CabType | Date       | Time  | Passenger | TripType |
	| Pritam | 9903793252 | pritam@test.com |      | Mini | AC      | 2025-07-28 | 09:30 | 2         | oneway |
	And User clicks on Book Now button
	Then Error message "Please Select the Trip" should be shown under Trip selection
@errordetected
Scenario: Submit form with empty number of passengers
	Given User launches the browser and opens the cab booking page
	When User fills the form with valid details:
	| Name | Phone      | Email         | Trip  | Cab  | CabType | Date       | Time  | Passenger | TripType |
	| Priya | 9903793252 | priya@test.com | local | Mini | AC      | 2025-07-28 | 09:30 |           | oneway |
	And User clicks on Book Now button
	Then Error message "Please Select the number of passengers" should be shown under Passenger count

@exceldata
Scenario: Booking with the data present in row 0 of Excel data
	Given User reads booking data from Excel sheet "BookingData" and row 0
	When User fills the form using Excel data
	And User clicks on Book Now button
	Then Booking confirmation message "Your Booking has been Confirmed" should be displayed
@exceldata
Scenario: Booking with the data present in row 1 of Excel data
	Given User reads booking data from Excel sheet "BookingData" and row 1
	When User fills the form using Excel data
	And User clicks on Book Now button
	Then Email error message "Please enter the email" should be displayed