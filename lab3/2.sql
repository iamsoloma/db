DO $$
DECLARE
    сNeedJob CONSTANT text = 'MANAGER'; --PRESIDENT; --CMM;
    vEname text;
BEGIN
    SELECT ename INTO STRICT vENAME 
    from emp.emp 
    WHERE job = сNeedJob;

    RAISE NOTICE 'найдена одна запись по должности %: %',сNeedJob, vEname;

EXCEPTION
    WHEN no_data_found THEN
        RAISE NOTICE 'ничего не найдено по должности %',сNeedJob;
    WHEN too_many_rows THEN
        RAISE NOTICE 'найдено более одной записи по должности %',сNeedJob;
    WHEN OTHERS THEN
        RAISE NOTICE 'Неизвестная ошибка!';
        RAISE NOTICE 'Ошибка[%]:%', SQLSTATE, SQLERRM;
END;
$$