CREATE OR REPLACE PROCEDURE emp.increaseSal(pDeptno numeric, percent numeric, pShema text, pTable text, pColumn text) LANGUAGE plpgsql AS $$
    DECLARE
        vQuery text;
        vUpdatedRows int;
    BEGIN
        vQuery = format('UPDATE %I.%I set %I = %I + (%I * %L / 100) where deptno = %L', pShema, pTable, pColumn, pColumn, pColumn, percent, pDeptno);
        RAISE NOTICE 'Запрос: %', vQuery;


        EXECUTE vQuery;

        GET DIAGNOSTICS vUpdatedRows = ROW_COUNT;
        RAISE NOTICE 'Изменено строк: %', vUpdatedRows;
END $$;