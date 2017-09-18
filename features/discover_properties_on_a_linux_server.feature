Feature: Discover Properties on a Linux Server
	A user must setup the credentials that will be used for the forage
	The user can then initate a forage for 1 or more hosts
	The status of the forage will tranistion to success, and the forage resultl can be 
	queired from the data platform.
	

Scenario: Search for the website        
        Given I have deployed DIG with service "mini-nginx-ingress-controller"
        Given I add SSH credentials for user "ec2-user" with key "./id_rsa-acceptance"
	Given I am on the DIG connect page 
	When I will start a forage for "centos1.fakehosts,ubuntu1.fakehosts"
	Then I should see status change to "success"
        And I should be able to view the forage data
