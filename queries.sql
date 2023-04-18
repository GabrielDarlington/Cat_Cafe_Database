-- 1. 
-- Explanation: Select all members From utah with 801 phone numbers using a LIKE statement
-- Demonstration: Shows how to use a LIKE statement and Wildcards
-- Business Rule: Show all customers that are availible for the Membership Signup. 

SELECT state_loc, phone_number 
FROM catcafe.dbo.MemberSignup 
WHERE phone_number LIKE '801%'; 

-- 2. 
-- Explanation: Select all Nonhealthy cats and order by VetId
-- Demonstration: Demonstrates how to use an Order By statement. 
-- Business Rule: Identify the cats that are not healthy, so they can be healed. 

SELECT cat_name, cat_health, vetID FROM Cats WHERE cat_health != 'Healthy' ORDER BY vetID; 


-- 3. 
-- Explanation: Adds cat to a database
-- Demonstration: Shows how to use an insert statement
-- Business Rule: Insert new cats that have been given to the business, into the database. 

INSERT INTO catcafe.dbo.Cats VALUES(2, 'Poptart', 'Nyan', 'Healthy', 4);


-- 4. 
-- Explanation: Make Unhealthy Cats Healthy in the database
-- Demonstration: Query shows how to use Update statements. 
-- Business Rule: Fix all the Unhealthy Cat in the database

UPDATE Cats
SET cat_health = 'Healthy'
WHERE
       cat_health ='Spay/Neuter procedure done' 
    OR cat_health = 'Risk of obesity, monitor diet' 
    OR cat_health = 'Diabetes, low carb diet w/ insulin' 
    OR cat_health = 'FLUTD, increase fluid intake and see vet again'
    OR cat_health = 'Treated for worms' 
    OR cat_health = 'Obesity, Weight Loss diet needed'; 

-- We can possibly do:
-- UPDATE CATS
-- SET cat_health = 'Healthy'
-- WHERE cat_health NOT 'Healthy'

-- 5. 
-- Explanation: Deletes members that aren't from Utah
-- Demonstration: Demonstrates how to use a delete statement
-- Business Rule: Make sure all members in the signup program are from Utah. 

DELETE FROM MemberSignup WHERE state_loc != 'Utah';

-- 6.  
-- Explanation:  Select statement using multiple aggregate functions
-- Demonstration: Demonstrate how to use aggregate functions 
-- Business Rule: Shows important Business information. 

SELECT 
    COUNT(adoptionID) AS amount_of_adoptions, 
    SUM(adoption_fee) AS Adoption_fee_sums, 
    Max(adoption_date) AS Max_date, 
    FLOOR(AVG(adoption_fee)) AS Average_adoption_fee 
FROM Adoptions;   

-- 7.  
-- Demonstration: Shows how to use Subqueries 
-- Explanation: Select statement utilizing a subquery that shows adoptions fees that are above the average.
-- Business Rule 

SELECT adoptionID, membershipID, employee_id, cat_id, adoption_fee FROM Adoptions
WHERE adoption_fee > (SELECT FLOOR(AVG(adoption_fee)) FROM Adoptions)
ORDER BY adoption_fee ASC; 

-- 8. 
-- Explanation: Display employees that 
-- Demonstration: Shows how to use a Case statement 
-- Business Rule: Employees that have earned more than 7000 can be promoted. 

SELECT employee_id,
CASE 
    WHEN year_to_date > 7000 THEN 'MORE than 7000$'
    ELSE 'LESS than 7000$' 
END AS employee_earnings
FROM Employee_pay; 

-- 9.
-- Explanation: Gets the current date. 
-- Demonstration: Shows how to use a Stored Procedures and Wildcards 
-- Business Rule: Get the current date, so that 

CREATE PROCEDURE get_date
AS
SELECT GETDATE() 
GO;
EXEC get_date;


SELECT DATEPART(WEEKDAY, GETDATE()) AS daynum

--  10. 
-- Demonstrate how to use a Select into statement 
-- Explanation 
-- Demonstration:
-- Business Rule:

SELECT cat_name INTO availible_cats
FROM Cats
WHERE cat_health = 'Healthy'; 
SELECT * FROM availible_cats;
