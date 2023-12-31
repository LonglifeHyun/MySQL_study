-- 코드를 입력하세요
# SELECT DATE_FORMAT(DATETIME, '%k')+0 AS HOUR, COUNT(1) AS COUNT
# FROM ANIMAL_OUTS 
# GROUP BY HOUR
# ORDER BY HOUR

SET @VAR1 := -1;

SELECT  @VAR1 := @VAR1 + 1 AS HOUR,
        (SELECT COUNT(B.ANIMAL_ID)
         FROM   ANIMAL_OUTS B
         WHERE  1=1
         AND    DATE_FORMAT(B.DATETIME,'%H') = @VAR1) AS COUNT
FROM    ANIMAL_OUTS
WHERE   @VAR1 < 23
;