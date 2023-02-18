-- First of first, let's connect to sys as sysdba
connect sys/sys as sysdba;

-- Now let's create a spool file
SPOOL C:\BD2\project_part1.txt

-- And we need to show the date and time the script was run
SELECT to_char(sysdate,'DD Month YYYY Day HH:MI"SS') FROM dual;

-- Finally starting to solve the project


-- QUESTION 1

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE proj1_q1 (num_in IN NUMBER) AS
	num_op NUMBER;
		BEGIN
	  		num_op := num_in;
	  		DBMS_OUTPUT.PUT_LINE('The triple of ' || num_op || ' is ' || num_op * 3 || ' . ');
		END;
	/

-- testing the procedure

exec proj1_q1(5)


-- QUESTION 2

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE proj1_q2 (num_in IN NUMBER) AS
	num_op NUMBER;
		BEGIN
	  		num_op := num_in;
	  		DBMS_OUTPUT.PUT_LINE(num_op || ' degree in C is equivalent to ' || ((9/5)*num_op+32) || ' in F.');
		END;
	/

-- testing the procedure

exec proj1_q2(40)


-- QUESTION 3

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE proj1_q3 (num_in IN NUMBER) AS
	num_op NUMBER;
		BEGIN
	  		num_op := num_in;
	  		DBMS_OUTPUT.PUT_LINE(num_op || ' degree in F is equivalent to ' || ((5/9)*(num_op-32)) || ' in C.');
		END;
	/

-- testing the procedure

exec proj1_q3(104)



-- QUESTION 4

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE proj1_q4 (num_in IN NUMBER) AS
	price NUMBER;
	gst NUMBER;
	qst NUMBER;
		BEGIN
	  		price := num_in;
			gst := 5/100;
			qst := 9.98/100;
	  		DBMS_OUTPUT.PUT_LINE('For the price of $' || price );
	  		DBMS_OUTPUT.PUT_LINE('You will have to pay $' || price * gst || ' GST');
	  		DBMS_OUTPUT.PUT_LINE('$' || price * qst || ' QST for a total of $' || (price *(gst+qst)));
	  		DBMS_OUTPUT.PUT_LINE('The GRAND TOTAL is $' || (price * (1+gst+qst)));
		END;
	/

-- testing the procedure

exec proj1_q4(100)


-- QUESTION 5

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE proj1_q5 (num1_in IN NUMBER, num2_in IN NUMBER) AS
	side1 NUMBER;
	side2 NUMBER;
		BEGIN
	  		side1 := num1_in;
			side2 := num2_in;
	  		DBMS_OUTPUT.PUT_LINE('The area of a ' || side1 || ' by ' || side2 || ' is ' || side1 * side2 || ' and its perimeter is ' || ((side1+side2)*2));
		END;
	/

-- testing the procedure

exec proj1_q5(2,3)


-- QUESTION 6

CREATE OR REPLACE FUNCTION proj1_q6 (num_in IN NUMBER)
	RETURN NUMBER AS
		num_out NUMBER;
	BEGIN
		num_out := num_in;
	RETURN ((9/5)*num_out+32);
END;
/

SELECT proj1_q6(30) FROM dual;
SELECT proj1_q6(15) FROM dual;
SELECT proj1_q6(-5) FROM dual;


-- QUESTION 7

CREATE OR REPLACE FUNCTION proj1_q7 (num_in IN NUMBER)
	RETURN NUMBER AS
		num_out NUMBER;
	BEGIN
		num_out := num_in;
	RETURN ((5/9)*(num_out-32));
END;
/

SELECT proj1_q7(76) FROM dual;
SELECT proj1_q7(50) FROM dual;
SELECT proj1_q7(20) FROM dual;


SPOOL OFF;