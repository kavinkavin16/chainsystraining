BEGIN
   DBMS_OUTPUT.put_line ('Hello!');
END;

--============================================
DECLARE
  l_message VARCHAR2( 255 ) := 'Hello All!';
BEGIN
  DBMS_OUTPUT.PUT_LINE( l_message );
END;

--============================================
DECLARE
      v_result NUMBER;
BEGIN
   v_result DEFAULT 10 / 0;
    DBMS_OUTPUT.PUT_LINE(V_RESULT );
   EXCEPTION
      WHEN ZERO_DIVIDE THEN
         DBMS_OUTPUT.PUT_LINE( SQLERRM);
END;
--===========================================



DECLARE
  l_shipping_status VARCHAR2( 25 ) not null := 'shipped';
BEGIN
  l_shipping_status := ' ';
  DBMS_OUTPUT.PUT_LINE(l_shipping_status);
END;

--============================================
DECLARE
  l_customer_name CUST_PERSONAL_INFO_2595.CUSTOMER_NAME%TYPE;
  l_CUSTOMER_ID CUST_PERSONAL_INFO_2595.CUSTOMER_ID%TYPE;
BEGIN
  SELECT
    CUSTOMER_name, CUSTOMER_ID
  INTO
    l_customer_name, l_CUSTOMER_ID
  FROM
    CUST_PERSONAL_INFO_2595
  WHERE
    customer_id = 'C-001';

  DBMS_OUTPUT.PUT_LINE(l_customer_name || ' : ' || l_cUSTOMER_ID );
END;
select * from cust_personal_info_2595;
--============================================

DECLARE
    a VARCHAR2(100) := 'Distributor';
    b VARCHAR2(100);
BEGIN
    b := a; 
    DBMS_OUTPUT.PUT_LINE('b is : ' || b);
END;
--=============================================
select interest from acco_info_2595;
DECLARE
    l_interest   ACCO_INFO_2595.interest%TYPE;
    l_avg_int     l_interest%TYPE;
    l_max_int     l_interest%TYPE;
    l_min_int     l_interest%TYPE;
BEGIN
    SELECT 
        MIN(interest), 
        MAX(interest), 
        AVG(interest)
    INTO 
        l_min_int,
        l_max_int, 
        l_avg_int
    FROM ACCO_INFO_2595;
  
       dbms_output.put_line('Min Interest: ' || l_min_int);
    dbms_output.put_line('Max Interest: ' || l_max_int);
    dbms_output.put_line('Avg Interest: ' ||  l_avg_int);
    
END;
    --======================
    
    DECLARE 
    co_pi     CONSTANT REAL  not null default /*:=*/ 3.14159;
    co_radius CONSTANT REAL := 10;
    co_area   CONSTANT REAL := (co_pi * co_radius**2);
BEGIN
--  CO_PI := 23;
    DBMS_OUTPUT.PUT_LINE(co_area);
END;

--========================
DECLARE n_sales NUMBER := 2000000; 
BEGIN 
   IF n_sales > 100000 THEN 
      DBMS_OUTPUT.PUT_LINE( 'Sales revenue is greater than 100K ' ); 
   END IF; 
END;

--==============
-- 14 AVOID CLUMSY IF
DECLARE
  B_IS_PROFITABLE BOOLEAN;
  n_sales      NUMBER := 100;
  n_costs      NUMBER := 2;
BEGIN
--  b_IS_profitable := false;   
--  IF n_sales > n_costs THEN
--    b_IS_profitable := true;
--  END IF;
 B_IS_PROFITABLE := n_sales > n_costs;
 IF(B_IS_PROFITABLE) THEN
  DBMS_OUTPUT.PUT_LINE( 'PROFIT' );
  ELSE
  DBMS_OUTPUT.PUT_LINE( 'LOSS' );
  END IF;
IF b_is_profitable = TRUE THEN
   DBMS_OUTPUT.PUT_LINE( 'This sales deal is profitable' );
END IF;
IF b_is_profitable THEN
   DBMS_OUTPUT.PUT_LINE( 'This sales deal is profitable' );
END IF;
end;
--================

DECLARE
  n_sales NUMBER := 300000;
  n_commission NUMBER( 10, 2 ) := 0;
BEGIN
  IF n_sales > 200000 THEN
    n_commission := n_sales * 0.6;
  ELSE
    n_commission := n_sales * 0.05;
  END IF;
  DBMS_OUTPUT.PUT_LINE(n_commission);
END;

--==============

DECLARE
  n_sales NUMBER := 300000;
  n_commission NUMBER( 10, 2 ) := 0;
BEGIN
  IF n_sales > 200000 THEN
    n_commission := n_sales * 0.1;
  ELSIF n_sales <= 200000 AND n_sales > 100000 THEN 
    n_commission := n_sales * 0.05;
  ELSIF n_sales <= 100000 AND n_sales > 50000 THEN 
    n_commission := n_sales * 0.03;
  ELSE
    n_commission := n_sales * 0.02;
  END IF;
    DBMS_OUTPUT.PUT_LINE(n_commission);
END;

--==============

DECLARE
  c_grade CHAR( 1 );
  c_rank  VARCHAR2( 20 );
BEGIN
  c_grade := 'B';
  CASE c_grade
  WHEN 'A' THEN
    c_rank := 'Excellent' ;
  WHEN 'B' THEN
    c_rank := 'Very Good' ;
  WHEN 'C' THEN
    c_rank := 'Good' ;
  WHEN 'D' THEN
    c_rank := 'Fair' ;
  WHEN 'F' THEN
    c_rank := 'Poor' ;
  ELSE
    c_rank := 'No such grade' ;
  END CASE;
  DBMS_OUTPUT.PUT_LINE( c_rank );
END;

--================
BEGIN
  GOTO second_message;

  <<first_message>>
  DBMS_OUTPUT.PUT_LINE( 'Hello' );
  GOTO the_end;

  <<second_message>>
  DBMS_OUTPUT.PUT_LINE( 'PL/SQL GOTO Demo' );
  GOTO first_message;

  <<the_end>>
  DBMS_OUTPUT.PUT_LINE( 'and good bye...' );

END;
--==================
DECLARE 
 string varchar(100);
BEGIN
 string := 'Kavin';
  case string
  when 'naresh' then
    DBMS_OUTPUT.PUT_LINE( 'naresh' );
when 'kavin' then
    DBMS_OUTPUT.PUT_LINE( 'kavin' );
    else 
     null;
    end case;
    END;

--====================================
DECLARE
  l_counter NUMBER := 0;
BEGIN
  LOOP
    l_counter := l_counter + 1;
--    IF l_counter > 3 THEN
--      EXIT;
--    END IF;
    EXIT WHEN l_counter > 3;
    dbms_output.put_line( 'Inside loop: ' || l_counter )  ;
  END LOOP;
  -- control resumes here after EXIT
  dbms_output.put_line( 'After loop: ' || l_counter );
END;
--===================
create table cars(name varchar2(50));
insert into cars
values('&name');
select * from cars;

--====

DECLARE
   n_counter NUMBER := 1;
BEGIN
   WHILE n_counter <= 5
      LOOP
        DBMS_OUTPUT.PUT_LINE( 'Counter : ' || n_counter );
        n_counter := n_counter + 1;
        -- EXIT WHEN n_counter = 3;
      END LOOP;
   END;
   
--===============

BEGIN
  FOR n_index IN 1 .. 10
  LOOP
    -- skip odd numbers
    IF MOD( n_index, 2 ) = 1 THEN
      CONTINUE;
    END IF;
    DBMS_OUTPUT.PUT_LINE( n_index );
  END LOOP;
END;
--=============END OF JANANI MAM PRACTICE QUESTIONS==========================--

--1.Write a PL/SQL program to arrange the number of two variable in such a way that the small number will store in
--num_small variable and large number will store in num_large variable.


DECLARE
num_small NUMBER := 8;
num_large NUMBER := 5;
num_temp NUMBER;
BEGIN

IF num_small > num_large THEN
num_temp := num_small;
num_small := num_large;
num_large := num_temp;
END IF;

DBMS_OUTPUT.PUT_LINE ('num_small = '||num_small);
DBMS_OUTPUT.PUT_LINE ('num_large = '||num_large);
END;











--===============================================================
--2.Write a PL/SQL program to check whether a given character is letter or digit.


DECLARE
    get_ctr CHAR(1) := '&inp';
BEGIN
    IF ( get_ctr >= 'A'
         AND get_ctr <= 'Z' )
        OR ( get_ctr >= 'a'
             AND get_ctr <= 'z' ) THEN
      dbms_output.Put_line ('The given character is a letter');
    ELSE
      dbms_output.Put_line ('The given character is not a letter');

      IF get_ctr BETWEEN '0' AND '9' THEN
        dbms_output.Put_line ('The given character is a number');
      ELSE
        dbms_output.Put_line ('The given character is not a number');
      END IF;
    END IF;
END; 
/

--====================================
--3)Write a program in PL/SQL to print the value of a variable inside and outside a loop using LOOP EXIT statement.


DECLARE
  n NUMBER := 0;
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE ('The value of n inside the loop is:  ' || TO_CHAR(n));
    n := n + 1;
    IF n > 5 THEN
      EXIT;
    END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('The value of n outside the loop is: ' || TO_CHAR(n));
END;
--===========================================================
--4.Write a PL/SQL program to display which day is a specific date
SET serveroutput ON
DECLARE
    t_dt  DATE := To_date('&input_a_date', 'DD-MON-YYYY');
    t_day VARCHAR2(1);
BEGIN
    t_day := To_char(t_dt, 'D');

    CASE t_day
      WHEN '1' THEN
        dbms_output.Put_line ('The date you entered is Sunday.');
      WHEN '2' THEN
        dbms_output.Put_line ('The date you entered is Monday.');
      WHEN '3' THEN
        dbms_output.Put_line ('The date you entered is Tuesday.');
      WHEN '4' THEN
        dbms_output.Put_line ('The date you entered is Wednesday.');
      WHEN '5' THEN
        dbms_output.Put_line ('The date you entered is Thursday.');
      WHEN '6' THEN
        dbms_output.Put_line ('The date you entered is Friday.');
      WHEN '7' THEN
        dbms_output.Put_line ('The date you entered is Saturday.');
    END CASE;
END;
--=====================================================================
--5)Write a PL/SQL procedure to calculate the incentive on a specific target otherwise a general incentive to be paid using IF-THEN-ELSE.
  
  
  
---===============> PROCEDURE IS NOT DISCUSSED IN TODAY'S SESSION (18-MAY-2021).

--===========================================
--6)Write a PL/SQL block to calculate the incentive of an employee whose ID is 110.

DECLARE
  incentive   NUMBER(10,2);
BEGIN
  SELECT salary * 0.12 INTO incentive
  FROM employees
  WHERE employee_id = 110;
DBMS_OUTPUT.PUT_LINE('Incentive  = ' || TO_CHAR(incentive));
END;

--=================================================================

--7)Write a block to display name, contact no and no of rows from employee table.



--====================================
--8.To develop a procedure named adjust_salary() sample database.
-- We’ll update the salary information of employees in the employees table by 
--using SQL UPDATE statement.
