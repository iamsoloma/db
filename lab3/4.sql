DO $$
DECLARE
    vNum1 INTEGER = 60;
    vNum2 INTEGER = 70;
    vNum3 INTEGER = 20;
    cName CONSTANT text = 'SALES';
    cCity CONSTANT text = 'CHICAGO';
BEGIN
    BEGIN
        INSERT INTO emp.newdept (deptno, dname, loc) VALUES(vNum1, cName, cCity);
    EXCEPTION
        WHEN unique_violation THEN
            RAISE NOTICE 'Вставка неуникальноного значения в % строке: %', vNum1, SQLERRM;
    END;
    BEGIN
        INSERT INTO emp.newdept (deptno, dname, loc) VALUES(vNum2, cName, cCity);
    EXCEPTION
        WHEN unique_violation THEN
            RAISE NOTICE 'Вставка неуникальноного значения в % строке: %', vNum2, SQLERRM;
    END;
    BEGIN
        INSERT INTO emp.newdept (deptno, dname, loc) VALUES(vNum3, cName, cCity);
    EXCEPTION
        WHEN unique_violation THEN
            RAISE NOTICE 'Вставка неуникальноного значения в % строке: %', vNum3, SQLERRM;
    END;

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Прерывание[%]:%', SQLSTATE, SQLERRM;
END;
$$