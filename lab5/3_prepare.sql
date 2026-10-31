CREATE table IF NOT EXISTS emp.bonus_ref(code numeric, percent numeric, comment varchar);
INSERT INTO emp.bonus_ref (code,
                       percent,
                       comment)
VALUES     (1, 3, 'минимальная'),
    (2, 6, 'средняя'),
    (3, 10, 'повышенная'),
    (4, 15, 'высокая'),
    (5, 20, 'за выслугу лет');