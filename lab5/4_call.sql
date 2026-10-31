DO $$
DECLARE
    vMaxSal NUMERIC;
BEGIN

    CALL GetMaxSal(10, vMaxSal, 'ПЕЧАТЬ'::TEXT);

    IF vMaxSal IS NOT NULL THEN
        RAISE NOTICE 'Наибоьшая зп: %', vMaxSal;
    ELSE 
        RAISE NOTICE 'Неполучилось найти наибольшуй зп';
    END IF;
END $$;

DO $$
DECLARE
    vMaxSal NUMERIC;
BEGIN

    CALL GetMaxSal(10, vMaxSal);

    IF vMaxSal IS NOT NULL THEN
        RAISE NOTICE 'Наибоьшая зп: %', vMaxSal;
    ELSE 
        RAISE NOTICE 'Неполучилось найти наибольшуй зп';
    END IF;
END $$;