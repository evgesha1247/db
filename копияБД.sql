--
-- Файл сгенерирован с помощью SQLiteStudio v3.3.3 в вт мар. 15 12:55:40 2022
--
-- Использованная кодировка текста: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Таблица: bilet
CREATE TABLE bilet (
    ID                 INTEGER NOT NULL,
    bilet_id_seans     INTEGER NOT NULL
                               REFERENCES seans (ID) ON DELETE CASCADE
                                                     ON UPDATE CASCADE,
    bilet_id_pokupatel INTEGER NOT NULL
                               REFERENCES pokupatel (ID) ON DELETE CASCADE
                                                         ON UPDATE CASCADE,
    bilet_mesto        INTEGER NOT NULL,
    bilet_data         DATE    NOT NULL,
    PRIMARY KEY (
        ID
    )
);

INSERT INTO bilet (
                      ID,
                      bilet_id_seans,
                      bilet_id_pokupatel,
                      bilet_mesto,
                      bilet_data
                  )
                  VALUES (
                      1,
                      2,
                      5,
                      234,
                      '21.23.30'
                  );

INSERT INTO bilet (
                      ID,
                      bilet_id_seans,
                      bilet_id_pokupatel,
                      bilet_mesto,
                      bilet_data
                  )
                  VALUES (
                      2,
                      1,
                      4,
                      456,
                      '21.24.30'
                  );


-- Таблица: cena
CREATE TABLE cena (
    ID   INTEGER PRIMARY KEY
                 NOT NULL,
    cena DECIMAL NOT NULL
);

INSERT INTO cena (
                     ID,
                     cena
                 )
                 VALUES (
                     1,
                     200
                 );

INSERT INTO cena (
                     ID,
                     cena
                 )
                 VALUES (
                     2,
                     500
                 );

INSERT INTO cena (
                     ID,
                     cena
                 )
                 VALUES (
                     3,
                     800
                 );


-- Таблица: films
CREATE TABLE films (
    ID             INTEGER NOT NULL,
    film_name      TEXT    NOT NULL,
    film_god       DATE    NOT NULL,
    film_time      TIME    NOT NULL,
    film_id_zhanr  INTEGER NOT NULL
                           REFERENCES zhanr (ID) ON DELETE CASCADE
                                                 ON UPDATE CASCADE,
    film_id_strana INTEGER REFERENCES strana (ID) ON DELETE CASCADE
                                                  ON UPDATE CASCADE
                           NOT NULL,
    PRIMARY KEY (
        ID
    )
);

INSERT INTO films (
                      ID,
                      film_name,
                      film_god,
                      film_time,
                      film_id_zhanr,
                      film_id_strana
                  )
                  VALUES (
                      1,
                      'Вечные',
                      2021,
                      '1:20:00',
                      5,
                      2
                  );

INSERT INTO films (
                      ID,
                      film_name,
                      film_god,
                      film_time,
                      film_id_zhanr,
                      film_id_strana
                  )
                  VALUES (
                      2,
                      'Человек-паук: Нет пути домой',
                      2021,
                      '1:45:00',
                      9,
                      5
                  );

INSERT INTO films (
                      ID,
                      film_name,
                      film_god,
                      film_time,
                      film_id_zhanr,
                      film_id_strana
                  )
                  VALUES (
                      3,
                      'Доктор Стрэндж: В мультивселенной безумия',
                      2022,
                      '2:00:20',
                      4,
                      3
                  );

INSERT INTO films (
                      ID,
                      film_name,
                      film_god,
                      film_time,
                      film_id_zhanr,
                      film_id_strana
                  )
                  VALUES (
                      4,
                      'Тор: Любовь и гром',
                      2022,
                      '1:50:00',
                      7,
                      7
                  );

INSERT INTO films (
                      ID,
                      film_name,
                      film_god,
                      film_time,
                      film_id_zhanr,
                      film_id_strana
                  )
                  VALUES (
                      5,
                      'Морбуис',
                      2022,
                      '2:20:00',
                      2,
                      2
                  );

INSERT INTO films (
                      ID,
                      film_name,
                      film_god,
                      film_time,
                      film_id_zhanr,
                      film_id_strana
                  )
                  VALUES (
                      6,
                      'Человек-паук: Вдали от дома',
                      2019,
                      '1:20:00',
                      7,
                      4
                  );


-- Таблица: kinotiater
CREATE TABLE kinotiater (
    ID               INTEGER NOT NULL,
    kinotiater_name  TEXT    NOT NULL,
    kinotiater_god   DATE    NOT NULL,
    kinotiater_adres TEXT    NOT NULL,
    PRIMARY KEY (
        ID
    )
);

INSERT INTO kinotiater (
                           ID,
                           kinotiater_name,
                           kinotiater_god,
                           kinotiater_adres
                       )
                       VALUES (
                           1,
                           'Киносфера',
                           1989,
                           'Правобережная, 1б '
                       );

INSERT INTO kinotiater (
                           ID,
                           kinotiater_name,
                           kinotiater_god,
                           kinotiater_adres
                       )
                       VALUES (
                           2,
                           'Космик',
                           1992,
                           'Варшавское шоссе, 160 '
                       );

INSERT INTO kinotiater (
                           ID,
                           kinotiater_name,
                           kinotiater_god,
                           kinotiater_adres
                       )
                       VALUES (
                           3,
                           'Люксор Vegas',
                           2000,
                           ' Неведомоямнеулица 231'
                       );

INSERT INTO kinotiater (
                           ID,
                           kinotiater_name,
                           kinotiater_god,
                           kinotiater_adres
                       )
                       VALUES (
                           4,
                           'Кинотеатер',
                           1999,
                           ' Неведомоямнеулица 123'
                       );

INSERT INTO kinotiater (
                           ID,
                           kinotiater_name,
                           kinotiater_god,
                           kinotiater_adres
                       )
                       VALUES (
                           5,
                           'Кинотеатер_2',
                           2002,
                           ' Профсоюзная, 61а '
                       );


-- Таблица: pokupatel
CREATE TABLE pokupatel (
    pokupatel_fio  TEXT    NOT NULL,
    ID             INTEGER NOT NULL,
    pokupatel_summ INTEGER NOT NULL,
    PRIMARY KEY (
        ID
    )
);

INSERT INTO pokupatel (
                          pokupatel_fio,
                          ID,
                          pokupatel_summ
                      )
                      VALUES (
                          'Иван Иваны Иванович',
                          1,
                          0
                      );

INSERT INTO pokupatel (
                          pokupatel_fio,
                          ID,
                          pokupatel_summ
                      )
                      VALUES (
                          'Анатолий Синичькин Васильевич',
                          2,
                          0
                      );

INSERT INTO pokupatel (
                          pokupatel_fio,
                          ID,
                          pokupatel_summ
                      )
                      VALUES (
                          'Осипова Арина Николаевна',
                          3,
                          0
                      );

INSERT INTO pokupatel (
                          pokupatel_fio,
                          ID,
                          pokupatel_summ
                      )
                      VALUES (
                          'Сидоров Глеб Матвеевич',
                          4,
                          0
                      );

INSERT INTO pokupatel (
                          pokupatel_fio,
                          ID,
                          pokupatel_summ
                      )
                      VALUES (
                          'Зайцева Ксения Ярославовна',
                          5,
                          0
                      );


-- Таблица: seans
CREATE TABLE seans (
    ID            INTEGER,
    seans_data    DATE    NOT NULL,
    seans_time    TIME    NOT NULL,
    seans_id_zal  INTEGER NOT NULL
                          REFERENCES zal (ID) ON DELETE NO ACTION
                                              ON UPDATE NO ACTION,
    seans_id_film INTEGER NOT NULL
                          REFERENCES films (ID) ON DELETE CASCADE
                                                ON UPDATE CASCADE,
    seans_id_cena INTEGER NOT NULL
                          REFERENCES cena (ID) ON DELETE CASCADE
                                               ON UPDATE CASCADE,
    PRIMARY KEY (
        ID
    )
);

INSERT INTO seans (
                      ID,
                      seans_data,
                      seans_time,
                      seans_id_zal,
                      seans_id_film,
                      seans_id_cena
                  )
                  VALUES (
                      1,
                      '22.03.01',
                      '12:30:00',
                      1,
                      1,
                      2
                  );

INSERT INTO seans (
                      ID,
                      seans_data,
                      seans_time,
                      seans_id_zal,
                      seans_id_film,
                      seans_id_cena
                  )
                  VALUES (
                      2,
                      '23.12.23',
                      '16:00:00',
                      1,
                      1,
                      1
                  );


-- Таблица: status
CREATE TABLE status (
    ID   INTEGER NOT NULL,
    name TEXT,
    PRIMARY KEY (
        ID
    )
);

INSERT INTO status (
                       ID,
                       name
                   )
                   VALUES (
                       1,
                       'no'
                   );

INSERT INTO status (
                       ID,
                       name
                   )
                   VALUES (
                       2,
                       'yes'
                   );


-- Таблица: strana
CREATE TABLE strana (
    ID   INTEGER NOT NULL,
    name TEXT    NOT NULL,
    PRIMARY KEY (
        ID
    )
);

INSERT INTO strana (
                       ID,
                       name
                   )
                   VALUES (
                       1,
                       'Россия'
                   );

INSERT INTO strana (
                       ID,
                       name
                   )
                   VALUES (
                       2,
                       'Германия'
                   );

INSERT INTO strana (
                       ID,
                       name
                   )
                   VALUES (
                       3,
                       'США'
                   );

INSERT INTO strana (
                       ID,
                       name
                   )
                   VALUES (
                       4,
                       'Англия'
                   );

INSERT INTO strana (
                       ID,
                       name
                   )
                   VALUES (
                       5,
                       'Франция'
                   );

INSERT INTO strana (
                       ID,
                       name
                   )
                   VALUES (
                       6,
                       'Голландия'
                   );

INSERT INTO strana (
                       ID,
                       name
                   )
                   VALUES (
                       7,
                       'Австралия'
                   );

INSERT INTO strana (
                       ID,
                       name
                   )
                   VALUES (
                       8,
                       'Австрия'
                   );

INSERT INTO strana (
                       ID,
                       name
                   )
                   VALUES (
                       9,
                       'Япония'
                   );

INSERT INTO strana (
                       ID,
                       name
                   )
                   VALUES (
                       10,
                       'Китай'
                   );


-- Таблица: zal
CREATE TABLE zal (
    ID                INTEGER NOT NULL,
    zal_vmestimost    INTEGER NOT NULL,
    zal_name          TEXT    NOT NULL,
    zal_id_kinotiater INTEGER NOT NULL
                              REFERENCES kinotiater (ID) ON DELETE CASCADE
                                                         ON UPDATE CASCADE,
    PRIMARY KEY (
        ID
    )
);

INSERT INTO zal (
                    ID,
                    zal_vmestimost,
                    zal_name,
                    zal_id_kinotiater
                )
                VALUES (
                    1,
                    300,
                    'зал1',
                    3
                );

INSERT INTO zal (
                    ID,
                    zal_vmestimost,
                    zal_name,
                    zal_id_kinotiater
                )
                VALUES (
                    2,
                    456,
                    'зла2',
                    4
                );


-- Таблица: zhanr
CREATE TABLE zhanr (
    ID   INTEGER NOT NULL,
    name TEXT    NOT NULL,
    PRIMARY KEY (
        ID
    )
);

INSERT INTO zhanr (
                      ID,
                      name
                  )
                  VALUES (
                      1,
                      'Фантастика'
                  );

INSERT INTO zhanr (
                      ID,
                      name
                  )
                  VALUES (
                      2,
                      'Приключения'
                  );

INSERT INTO zhanr (
                      ID,
                      name
                  )
                  VALUES (
                      3,
                      'Боевик'
                  );

INSERT INTO zhanr (
                      ID,
                      name
                  )
                  VALUES (
                      4,
                      'Фэнтези'
                  );

INSERT INTO zhanr (
                      ID,
                      name
                  )
                  VALUES (
                      5,
                      'Ужасы'
                  );

INSERT INTO zhanr (
                      ID,
                      name
                  )
                  VALUES (
                      6,
                      'Драма'
                  );

INSERT INTO zhanr (
                      ID,
                      name
                  )
                  VALUES (
                      7,
                      'Комедия'
                  );

INSERT INTO zhanr (
                      ID,
                      name
                  )
                  VALUES (
                      8,
                      'Детектив'
                  );

INSERT INTO zhanr (
                      ID,
                      name
                  )
                  VALUES (
                      9,
                      'Вестерн'
                  );

INSERT INTO zhanr (
                      ID,
                      name
                  )
                  VALUES (
                      10,
                      'Исторический'
                  );


-- Индекс: film_asc_index
CREATE UNIQUE INDEX film_asc_index ON films (
    ID ASC
);


-- Индекс: film_desc_index
CREATE UNIQUE INDEX film_desc_index ON films (
    ID DESC
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
