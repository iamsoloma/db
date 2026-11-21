CREATE OR REPLACE FUNCTION getEmpInfo(colJob text default 'job', pJob text default null, pSal numeric default null) RETURNS text LANGUAGE plpgsql AS $$
DECLARE
        vQuery text;
        vName text;
        vSal text;
BEGIN

        vQuery = format('SELECT ename, sal from emp.emp where %I = $1', colJob);


        IF pSal IS NOT NULL THEN
            vQuery = vQuery || ' ' || 'AND sal >= $2';
        END IF;

        vQuery = vQuery || ' ' || 'ORDER By sal DESC LIMIT 1';

        RAISE NOTICE 'Запрос: %', vQuery;

        IF pSal IS NOT NULL THEN
            EXECUTE vQuery INTO vName, vSal USING pJob, pSal;
        ELSE
            EXECUTE vQuery INTO vName, vSal using pJob;
        END IF;

        IF vName IS NULL THEN
            RAISE NOTICE 'Никого не нашли';
            RETURN NULL;
        END IF;

        RETURN vName || ', ' || vSal;
END
$$;