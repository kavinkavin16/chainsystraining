--SELECT * FROM CUSTOMER_PERSONAL_INFO_2605;  
--SELECT * FROM CUSTOMER_REFERENCE_INFO_2605;
--SELECT * FROM BANK_INFO_2605;
--SELECT * FROM ACCOUNT_INFO_2605;
                                        --TABLES CREATION--
CREATE  TABLE CUST_PERSONAL_INFO_2595 AS SELECT  * FROM CUSTOMER_PERSONAL_INFO_2605;
CREATE  TABLE CUST_REFERENCE_INFO_2595 AS SELECT  * FROM CUSTOMER_REFERENCE_INFO_2605;
CREATE  TABLE BANK_INFO_2595 AS SELECT  * FROM BANK_INFO_2605;
CREATE  TABLE ACCO_INFO_2595 AS SELECT  * FROM ACCOUNT_INFO_2605;
                                        --SELECTING DATA IN TABLES--
SELECT * FROM CUST_PERSONAL_INFO_2595;
SELECT * FROM CUST_REFERENCE_INFO_2595;
SELECT * FROM BANK_INFO_2595;
SELECT * FROM ACCO_INFO_2595;

--1) Write a query which will display the customer id, account type they hold, their account number and bank name.

SELECT CU.CUSTOMER_ID,AC.ACCOUNT_TYPE,BA.BANK_NAME,AC.ACCOUNT_NO
FROM CUST_PERSONAL_INFO_2595 CU
JOIN ACCO_INFO_2595 AC ON CU.CUSTOMER_ID = AC.CUSTOMER_ID
JOIN BANK_INFO_2595 BA ON AC.IFSC_CODE=BA.IFSC_CODE

--2) Write a query which will display the customer id, account type and the account number of HDFC customers who registered
--   after 12-JAN-2012 and before 04-APR-2012.

SELECT AC.CUSTOMER_ID,AC.ACCOUNT_TYPE,AC.ACCOUNT_NO,AC.REGISTRATION_DATE,BA.BANK_NAME
FROM ACCO_INFO_2595 AC
JOIN BANK_INFO_2595 BA ON AC.IFSC_CODE=BA.IFSC_CODE
WHERE BA.BANK_NAME = 'HDFC' AND AC.REGISTRATION_DATE BETWEEN '12-JAN-2012' AND '04-APR-2012'

--3) Write a query which will display the customer id, customer name, account no, account type and 
--   bank name where the customers hold the account.

SELECT CU.CUSTOMER_ID,CU.CUSTOMER_NAME,AC.ACCOUNT_NO,BA.BANK_NAME
FROM CUST_PERSONAL_INFO_2595 CU
JOIN ACCO_INFO_2595 AC ON CU.CUSTOMER_ID = AC.CUSTOMER_ID
JOIN BANK_INFO_2595 BA ON AC.IFSC_CODE = BA.IFSC_CODE;



--4) Write a query which will display the customer id, customer name, gender, marital status along with the unique reference string and sort the records based on customer id in descending order. 
--   Hint:  Generate unique reference string as mentioned below 
--   Use ""UNIQUE_REF_STRING"" as alias name for displaying the unique reference string."



--5) Write a query which will display the account number, customer id, registration date, initial deposit amount of the customer
-- whose initial deposit amount is within the range of Rs.15000 to Rs.25000.

SELECT AC.ACCOUNT_NO,AC.CUSTOMER_ID,AC.REGISTRATION_DATE,AC.INITIAL_DEPOSIT
FROM ACCO_INFO_2595 AC
WHERE AC.INITIAL_DEPOSIT BETWEEN 15000 AND 25000;

--6) Write a query which will display customer id, customer name, date of birth, guardian name of the customers whose name starts with 'J'.

SELECT CU.CUSTOMER_ID,CU.CUSTOMER_NAME,CU.DATE_OF_BIRTH,CU.GUARDIAN_NAME
FROM CUST_PERSONAL_INFO_2595 CU
WHERE CU.CUSTOMER_NAME LIKE 'J%'

--7) Write a query which will display customer id, account number and passcode. 
--   
--Hint:  To generate passcode, join the last three digits of customer id and last four digit of account number.
-- 
--  Example
--: C-001                   1234567898765432                0015432
--. Use ""PASSCODE"" as alias name for displaying the passcode."

SELECT AC.CUSTOMER_ID,AC.ACCOUNT_NO,SUBSTR(CUSTOMER_ID,-3)||SUBSTR(ACCOUNT_NO,-4) PASSCODE
FROM ACCO_INFO_2595 AC

--8) Write a query which will display the customer id, customer name, date of birth, Marital Status, Gender, Guardian name, 
--contact no and email id of the customers whose gender is male 'M' and marital status is MARRIED.

SELECT CUSTOMER_ID,CUSTOMER_NAME,DATE_OF_BIRTH,MARITAL_STATUS,GENDER,GUARDIAN_NAME,CONTACT_NO,MAIL_ID
FROM CUST_PERSONAL_INFO_2595
WHERE GENDER='M' AND MARITAL_STATUS LIKE 'M%'

--9) Write a query which will display the customer id, customer name, guardian name, reference account holders name of the  
--  customers who are referenced / referred by their 'FRIEND'.

SELECT CU.CUSTOMER_NAME,CU.GUARDIAN_NAME,CU.CUSTOMER_ID,CUF.REFERENCE_ACC_NAME,CUF.RELATION
FROM CUST_PERSONAL_INFO_2595 CU
JOIN CUST_REFERENCE_INFO_2595 CUF ON CU.CUSTOMER_ID=CUF.CUSTOMER_ID
WHERE CUF.RELATION LIKE 'F%'

--10) Write a query to display the customer id, account number and interest amount in the below format with INTEREST_AMT 
-- as alias name Sort the result based on the INTEREST_AMT in ascending order.Hint: Need to prefix $ to interest amount and 
--round the result without decimals.

SELECT CUSTOMER_ID,ACCOUNT_NO,'$'||ROUND((INTEREST/100)*INITIAL_DEPOSIT) INTEREST_AMT
FROM ACCO_INFO_2595;

--11) Write a query which will display the customer id, customer name, account no, account type, activation date,
-- bank name whose account will be activated on '10-APR-2012

SELECT CU.CUSTOMER_ID,CU.CUSTOMER_NAME,AC.ACCOUNT_NO,AC.ACCOUNT_TYPE,AC.ACTIVATION_DATE
FROM CUST_PERSONAL_INFO_2595 CU
JOIN ACCO_INFO_2595 AC ON CU.CUSTOMER_ID=AC.CUSTOMER_ID
WHERE AC.ACTIVATION_DATE='10-APR-2012'

--12) Write a query which will display account number, customer id, customer name, bank name, branch name, ifsc code,citizenship, 
--interest and initial deposit amount of all the customers.

SELECT AC.ACCOUNT_NO,AC.IFSC_CODE,AC.INTEREST,AC.INITIAL_DEPOSIT,CU.CITIZENSHIP,CU.CUSTOMER_ID,CU.CUSTOMER_NAME,BA.BANK_NAME,BA.BRANCH_NAME
FROM CUST_PERSONAL_INFO_2595 CU
JOIN ACCO_INFO_2595 AC ON CU.CUSTOMER_ID = AC.CUSTOMER_ID
JOIN BANK_INFO_2595 BA ON AC.IFSC_CODE=BA.IFSC_CODE

--13) Write a query which will display customer id, customer name, date of birth, guardian name, contact number,
-- mail id and reference account holder's name of the customers who has submitted the passport as an identification document.

SELECT CU.CUSTOMER_ID,CU.CUSTOMER_NAME,CU.DATE_OF_BIRTH,CU.GUARDIAN_NAME,CU.CONTACT_NO,CU.MAIL_ID,CU.IDENTIFICATION_DOC_TYPE,
CUF.REFERENCE_ACC_NAME
FROM CUST_PERSONAL_INFO_2595 CU
JOIN CUST_REFERENCE_INFO_2595 CUF ON CUF.CUSTOMER_ID=CU.CUSTOMER_ID
WHERE IDENTIFICATION_DOC_TYPE LIKE 'PAS%'

--14) Write a query to display the customer id, customer name, account number, account type, initial deposit,
--interest who have deposited maximum amount in the bank.

SELECT CU.CUSTOMER_ID,CU.CUSTOMER_NAME,AC.ACCOUNT_NO,AC.ACCOUNT_TYPE,AC.INITIAL_DEPOSIT,AC.INTEREST
FROM CUST_PERSONAL_INFO_2595 CU
JOIN ACCO_INFO_2595 AC ON AC.CUSTOMER_ID=CU.CUSTOMER_ID
WHERE INITIAL_DEPOSIT =(SELECT MAX(INITIAL_DEPOSIT) FROM ACCO_INFO_2595)

--15) Write a query to display the customer id, customer name, account number, account type, interest, 
--bank name and initial deposit amount of the customers who are getting maximum interest rate.

SELECT CU.CUSTOMER_ID,CU.CUSTOMER_NAME,AC.ACCOUNT_NO,AC.ACCOUNT_TYPE,AC.INITIAL_DEPOSIT,AC.INTEREST,BA.BANK_NAME
FROM CUST_PERSONAL_INFO_2595 CU
JOIN ACCO_INFO_2595 AC ON AC.CUSTOMER_ID=CU.CUSTOMER_ID
JOIN BANK_INFO_2595 BA ON BA.IFSC_CODE=AC.IFSC_CODE
WHERE INTEREST =(SELECT MAX(INTEREST) FROM ACCO_INFO_2595)

--16) Write a query to display the customer id, customer name, account no, bank name, contact no and mail id of 
--the customers who are from BANGALORE.

SELECT CU.CUSTOMER_ID,CU.CUSTOMER_NAME,AC.ACCOUNT_NO,BA.BANK_NAME,CU.CONTACT_NO,CU.MAIL_ID,CU.ADDRESS
FROM CUST_PERSONAL_INFO_2595 CU
JOIN ACCO_INFO_2595 AC ON AC.CUSTOMER_ID=CU.CUSTOMER_ID
JOIN BANK_INFO_2595 BA ON BA.IFSC_CODE=AC.IFSC_CODE
WHERE CU.ADDRESS LIKE '%ORE'

--17) Write a query which will display customer id, bank name, branch name, ifsc code, registration date,activation date of the customers
--whose activation date is in the month of march (March 1'st to March 31'st).

SELECT AC.CUSTOMER_ID,BA.BANK_NAME,BA.BRANCH_NAME,AC.IFSC_CODE,AC.REGISTRATION_DATE,AC.ACTIVATION_DATE
FROM ACCO_INFO_2595 AC--,BANK_INFO_2595 BA
JOIN BANK_INFO_2595 BA ON BA.IFSC_CODE=AC.IFSC_CODE
WHERE AC.ACTIVATION_DATE BETWEEN '01-MAR-2012' AND '31-MAR-2012'

--18) Write a query which will calculate the interest amount and display it along with customer id, customer name, 
--account number, account type, interest, and initial deposit amount.<BR>Hint :Formula for interest amount, 
--calculate: ((interest/100) * initial deposit amt) with column name 'interest_amt' (alias)

SELECT CU.CUSTOMER_ID,CU.CUSTOMER_NAME,AC.ACCOUNT_NO,AC.ACCOUNT_TYPE,AC.INTEREST,AC.INITIAL_DEPOSIT,
((INTEREST/100)*INITIAL_DEPOSIT) INTEREST_AMT
FROM CUST_PERSONAL_INFO_2595 CU
JOIN ACCO_INFO_2595 AC ON CU.CUSTOMER_ID=AC.CUSTOMER_ID

--19) Write a query to display the customer id, customer name, date of birth, guardian name, contact number, 
--mail id, reference name who has been referenced by 'RAGHUL'.

SELECT CU.CUSTOMER_ID,CU.CUSTOMER_NAME,CU.DATE_OF_BIRTH,CU.GUARDIAN_NAME,CU.CONTACT_NO,CU.MAIL_ID,CUF.REFERENCE_ACC_NAME
FROM CUST_PERSONAL_INFO_2595 CU
JOIN CUST_REFERENCE_INFO_2595 CUF ON CUF.CUSTOMER_ID=CU.CUSTOMER_ID
WHERE CUF.REFERENCE_ACC_NAME ='RAGHUL'

--20) Write a query which will display the customer id, customer name and contact number with ISD code of 
--all customers in below mentioned format.  Sort the result based on the customer id in descending order. 
--Format for contact number is :  
--""+91-3digits-3digits-4digits""
-- Example: +91-924-234-2312
-- Use ""CONTACT_ISD"" as alias name."

SELECT CUSTOMER_ID,CUSTOMER_NAME,'+91'||'-'||SUBSTR(CONTACT_NO,1,3)||'-'||SUBSTR(CONTACT_NO,4,6)||'-'||SUBSTR(CONTACT_NO,7,10) CONTACT_NO
FROM CUST_PERSONAL_INFO_2595
ORDER BY CUSTOMER_ID

--21) Write a query which will display account number, account type, customer id, customer name, date of birth, guardian name, 
--contact no, mail id , gender, reference account holders name, reference account holders account number, registration date, 
--activation date, number of days between the registration date and activation date with alias name "NoofdaysforActivation", 
--bank name, branch name and initial deposit for all the customers.

 SELECT AC.ACCOUNT_NO,AC.ACCOUNT_TYPE,CU.CUSTOMER_ID,CU.CUSTOMER_NAME,CU.DATE_OF_BIRTH,CU.GUARDIAN_NAME,
 CU.CONTACT_NO,CU.MAIL_ID,CU.GENDER,CUF.REFERENCE_ACC_NAME,CUF.REFERENCE_ACC_NO,AC.REGISTRATION_DATE,AC.ACTIVATION_DATE,
 BA.BANK_NAME,BA.BRANCH_NAME,AC.INITIAL_DEPOSIT, TO_DATE(AC.ACTIVATION_DATE) - TO_DATE(AC.REGISTRATION_DATE)  NOOFDAYSFORACTIVATION
 FROM CUST_PERSONAL_INFO_2595 CU
 JOIN ACCO_INFO_2595 AC ON AC.CUSTOMER_ID=CU.CUSTOMER_ID
 JOIN BANK_INFO_2595 BA ON BA.IFSC_CODE=AC.IFSC_CODE
 JOIN CUST_REFERENCE_INFO_2595 CUF ON CUF.CUSTOMER_ID=CU.CUSTOMER_ID
 
-- 22) Write a query which will display customer id, customer name,  guardian name, identification doc type,
-- reference account holders name, account type, ifsc code, bank name and current balance for the customers 
--who has only the savings account. 
--<br/>Hint:  Formula for calculating current balance is add the intital deposit amount and interest
-- and display without any decimals. Use ""CURRENT_BALANCE"" as alias name."

SELECT CU.CUSTOMER_ID,CU.CUSTOMER_NAME,CU.GUARDIAN_NAME,CU.IDENTIFICATION_DOC_TYPE,CUF.REFERENCE_ACC_NAME,AC.ACCOUNT_TYPE,AC.IFSC_CODE,
BA.BANK_NAME,ROUND(AC.INITIAL_DEPOSIT+AC.INTEREST) CURRENT_BALANCE
FROM CUST_PERSONAL_INFO_2595 CU
JOIN ACCO_INFO_2595 AC ON CU.CUSTOMER_ID=AC.CUSTOMER_ID
JOIN CUST_REFERENCE_INFO_2595 CUF ON CUF.CUSTOMER_ID=CU.CUSTOMER_ID
JOIN BANK_INFO_2595 BA ON BA.IFSC_CODE=AC.IFSC_CODE
WHERE AC.ACCOUNT_TYPE LIKE 'SAVINGS'

--23) Write a query which will display the customer id, customer name, account number, account type, interest, initial deposit;check the initial deposit, if initial deposit is 20000 then display ""high"",
--if initial deposit is 16000 display 'moderate', if initial deposit is 10000 display 'average', if initial deposit is 5000 display 'low', if initial deposit is 0 display
-- 'very low' otherwise display 'invalid' and sort by interest in descending order.
--Hint: Name the column as ""Deposit_Status"" (alias). 
--Strictly follow the lower case for strings in this query."

SELECT A.CUSTOMER_ID,CUSTOMER_NAME,ACCOUNT_NO,ACCOUNT_TYPE,INTEREST,INITIAL_DEPOSIT,
CASE 
WHEN INITIAL_DEPOSIT=20000 THEN 'HIGH'
WHEN INITIAL_DEPOSIT=16000 THEN 'MODERATE'
WHEN INITIAL_DEPOSIT=10000 THEN 'AVERAGE'
WHEN INITIAL_DEPOSIT=5000 THEN 'LOW'
WHEN INITIAL_DEPOSIT=0 THEN 'VERY LOW'
END
AS DEPOSIT_STATUS
FROM CUST_PERSONAL_INFO_2595 A,ACCO_INFO_2595 B
WHERE  A.CUSTOMER_ID=B.CUSTOMER_ID 
ORDER BY INTEREST  DESC;

--24) Write a query which will display customer id, customer name,  account number, account type, bank name, ifsc code, initial deposit amount
-- and new interest amount for the customers whose name starts with ""J"". 
--<br/> Hint:  Formula for calculating ""new interest amount"" is 
--if customers account type is savings then add 10 % on current interest amount to interest amount else display the current interest amount.
-- Round the new interest amount to 2 decimals.<br/> Use ""NEW_INTEREST"" as alias name for displaying the new interest amount.
--
--<br/>Example, Assume Jack has savings account and his current interest amount is 10.00, then the new interest amount is 11.00 i.e (10 + (10 * 10/100)). 
--"

SELECT A.CUSTOMER_ID,CUSTOMER_NAME,ACCOUNT_NO,ACCOUNT_TYPE,BANK_NAME,
B.IFSC_CODE,INITIAL_DEPOSIT,
CASE
WHEN ACCOUNT_TYPE='SAVINGS' 
THEN ROUND(INTEREST+(INTEREST * 10/100 ))/100*INITIAL_DEPOSIT
ELSE ROUND(INTEREST/100*INITIAL_DEPOSIT)
END AS NEW_INTEREST
FROM CUST_PERSONAL_INFO_2595 A,ACCO_INFO_2595 B,BANK_INFO_2595 C
WHERE  A.CUSTOMER_ID=B.CUSTOMER_ID AND B.IFSC_CODE=C.IFSC_CODE AND CUSTOMER_NAME LIKE 'J%';

--25) Write query to display the customer id, customer name, account no, initial deposit, tax percentage as calculated below.
--<BR>Hint: <BR>If initial deposit = 0 then tax is '0%'<BR>If initial deposit &lt;= 10000 then tax is '3%' 
--<BR>If initial deposit &gt; 10000 and initial deposit &lt; 20000 then tax is '5%' <BR>If initial deposit &gt;= 20000 and
-- initial deposit&lt;=30000 then tax is '7%' <BR>If initial deposit &gt; 30000 then tax is '10%' <BR>Use the alias name 'taxPercentage'

SELECT A.CUSTOMER_ID,CUSTOMER_NAME,ACCOUNT_NO,INITIAL_DEPOSIT,
CASE
WHEN INITIAL_DEPOSIT=0 THEN '0%'
WHEN INITIAL_DEPOSIT=10000 THEN '3%'
WHEN INITIAL_DEPOSIT=16000 THEN '5%'    
WHEN INITIAL_DEPOSIT=30000 THEN '10%'
END AS TAX_PERCENTAGE
FROM CUST_PERSONAL_INFO_2595 A,ACCO_INFO_2595 B
WHERE  A.CUSTOMER_ID=B.CUSTOMER_ID ;

--================================================================================================================--


