CREATE DATABASE IF NOT EXISTS seminar_6;
USE seminar_6;

-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
DROP PROCEDURE IF EXISTS time_transition;
DELIMITER $$ 
CREATE PROCEDURE time_transition
(
	IN sec_number INT 
)
BEGIN
	DECLARE days INT DEFAULT 0;
    DECLARE hours INT DEFAULT 0;
    DECLARE minutes INT DEFAULT 0;
    DECLARE seconds INT DEFAULT 0;
    DECLARE resid INT DEFAULT 0;
	SET days =  sec_number DIV 86400;
    SET resid = sec_number - days * 86400;  
    SET hours = resid DIV 3600;
    SET resid = resid - hours * 3600;
    SET minutes = resid DIV 60;
    SET resid = resid - minutes * 60;
    SET seconds = resid;
    SELECT CONCAT (days, ' days, ', hours, ' hours, ', minutes, ' minutes, ', seconds, ' seconds');
END $$ 
DELIMITER ;

CALL time_transition(123456);

-- Выведите только четные числа от 1 до 10 (Через цикл).
-- Пример: 2,4,6,8,10
DROP PROCEDURE IF EXISTS even_numbers;
DELIMITER // 
CREATE PROCEDURE even_numbers
(
	IN number_to INT 
)
BEGIN
	DECLARE result VARCHAR(45) DEFAULT "";
    DECLARE n INT DEFAULT 2;
    IF number_to < 2 THEN
		SET result = 'Введите число равное или больше 2';
	ELSE
		REPEAT
			SET result = CONCAT(result, n, ", ");
			SET n = n + 2;
			UNTIL n > number_to
		END REPEAT;
    END IF;
    SELECT result;
END // 
DELIMITER ;

CALL even_numbers (10);

