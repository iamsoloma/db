DO $$
DECLARE
    vNum1 NUMERIC;
    vNum2 NUMERIC;
    vNum3 NUMERIC(1,0);
BEGIN
    vNum1 = 9;
    vNum2 = 3;
    vNum3 = vNum1 * vNum2;

    RAISE NOTICE 'Вычислено произведение: %', vNum3;

EXCEPTION
    WHEN numeric_value_out_of_range THEN
        RAISE NOTICE 'Переполнение числовой переменной!';
        RAISE NOTICE 'Ошибка[%]:%', SQLSTATE, SQLERRM;
    WHEN OTHERS THEN
        RAISE NOTICE 'Неизвестная ошибка!';
        RAISE NOTICE 'Ошибка[%]:%', SQLSTATE, SQLERRM;
END;
$$