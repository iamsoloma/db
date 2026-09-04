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
