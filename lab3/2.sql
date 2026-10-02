DO $$
DECLARE
    needJob CONSTANT text = 'MANAGER'; --PRESIDENT; --CMM;
    vEname text;
BEGIN
    SELECT ename INTO STRICT vENAME 
    from emp.emp 
    WHERE job = needJob;

    RAISE NOTICE 'найдена одна запись по должности %: %',needJob, vEname;

EXCEPTION
    WHEN no_data_found THEN
        RAISE NOTICE 'ничего не найдено по должности %',needJob;
    WHEN too_many_rows THEN
        RAISE NOTICE 'найдено более одной записи по должности %',needJob;
    WHEN OTHERS THEN
        RAISE NOTICE 'Неизвестная ошибка!';
        RAISE NOTICE 'Ошибка[%]:%', SQLSTATE, SQLERRM;
END;
$$