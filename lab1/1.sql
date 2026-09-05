DO $$
DECLARE
    vNum1 INTEGER = 1;
    vNum2 INTEGER = 2;
    diff INTEGER;
BEGIN
    diff = vNum2 - vNum1;
    RAISE NOTICE 'Разность 2 и 1 = %', diff;
END;
$$;

DO $$
DECLARE
    vNum1 INTEGER = 1;
    vNum2 INTEGER = 2;
    diff INTEGER;
BEGIN
    diff = vNum2 - vNum1;
    if diff < 0 then 
        diff = diff * -1;
    end if;
    RAISE NOTICE 'Разность 1 и 2 = %', diff;
END;
$$;

DO $$
DECLARE
    vNum1 INTEGER = 1;
    vNum2 INTEGER = 2;
    diff INTEGER;
BEGIN
    diff = ABS(vNum2 - vNum1);
    RAISE NOTICE 'Разность 1 и 2 = %', diff;
END;
$$;