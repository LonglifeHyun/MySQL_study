-- 코드를 입력하세요
SELECT A.ANIMAL_ID, A.NAME
FROM ANIMAL_INS A
JOIN ANIMAL_OUTS B USING (ANIMAL_ID)
WHERE B.ANIMAL_ID IS NOT NULL
AND A.DATETIME >= B.DATETIME
ORDER BY A.DATETIME