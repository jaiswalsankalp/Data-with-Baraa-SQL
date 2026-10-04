-- ROUND rounds up/down a floating point number upto specified decimal places
SELECT
	ROUND(3.516, 2),
	ROUND(3.41, 0),
	ROUND(2.418, 1),
	ROUND(3.516, 0)
;

-- ABS gives absolute Value of a Number
SELECT
	ABS(-2.56),
	ABS(-3),
	ABS(10)
;

-- FLOOR/CEILING Rounds a number Up/Down to the Nearest Integer
SELECT
	FLOOR(2.52),
	CEILING(3.15)
;

-- TRUNCATE Truncate a floating point number upto specified decimal places without rounding
-- Not available in some Databases
SELECT
	TRUNCATE(3.142, 2)
;

-- MOD(dividend, divisor) Returns the division remainder
-- Not available in some Databases
SELECT
	MOD(10,3)
;

-- POWER(base, exponent) Raises a number to a power
SELECT
	POWER(2,3)
;

-- SQRT(number) Returns the Square Root of that Number
SELECT
	SQRT(49)
;