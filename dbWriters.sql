--
-- Файл сгенерирован с помощью SQLiteStudio v3.3.3 в сб мая 28 21:23:24 2022
--
-- Использованная кодировка текста: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Таблица: bookBinding
CREATE TABLE bookBinding (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name STRING NOT NULL);
INSERT INTO bookBinding (id, name) VALUES (1, 'твердый');
INSERT INTO bookBinding (id, name) VALUES (2, 'мягкий');

-- Таблица: genre
CREATE TABLE genre (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name STRING NOT NULL);
INSERT INTO genre (id, name) VALUES (1, 'роман');
INSERT INTO genre (id, name) VALUES (2, 'рассказ');
INSERT INTO genre (id, name) VALUES (3, 'повесть');
INSERT INTO genre (id, name) VALUES (4, 'пьеса');
INSERT INTO genre (id, name) VALUES (5, 'новелла');
INSERT INTO genre (id, name) VALUES (6, 'трагедия');
INSERT INTO genre (id, name) VALUES (7, 'комедия');
INSERT INTO genre (id, name) VALUES (8, 'художественный вымысел');
INSERT INTO genre (id, name) VALUES (9, 'поэзия');
INSERT INTO genre (id, name) VALUES (10, 'поэма');
INSERT INTO genre (id, name) VALUES (11, 'Научная фантастика');

-- Таблица: products
CREATE TABLE products (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name STRING NOT NULL, idWriter INTEGER REFERENCES writers (id) ON DELETE CASCADE ON UPDATE CASCADE, idGenre INTEGER NOT NULL REFERENCES genre (id) ON DELETE CASCADE ON UPDATE CASCADE, idPublisher INTEGER REFERENCES publishers (id) ON DELETE CASCADE ON UPDATE CASCADE, idBookBinding INTEGER REFERENCES bookBinding (id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL, remark STRING);
INSERT INTO products (id, name, idWriter, idGenre, idPublisher, idBookBinding, remark) VALUES (1, 'Война и мир', 1, 1, 5, 1, NULL);
INSERT INTO products (id, name, idWriter, idGenre, idPublisher, idBookBinding, remark) VALUES (2, 'Пятая колонна', 2, 4, 4, 2, NULL);
INSERT INTO products (id, name, idWriter, idGenre, idPublisher, idBookBinding, remark) VALUES (3, 'Автостопом по Галактике', 15, 1, 2, 2, NULL);
INSERT INTO products (id, name, idWriter, idGenre, idPublisher, idBookBinding, remark) VALUES (4, 'Дети апокалипсиса', 10, 11, 5, 2, NULL);
INSERT INTO products (id, name, idWriter, idGenre, idPublisher, idBookBinding, remark) VALUES (5, 'Реквием', 9, 10, 5, 2, NULL);
INSERT INTO products (id, name, idWriter, idGenre, idPublisher, idBookBinding, remark) VALUES (6, 'Вечерние огни', 8, 9, 5, 1, NULL);
INSERT INTO products (id, name, idWriter, idGenre, idPublisher, idBookBinding, remark) VALUES (7, 'Незнакомка', 7, 8, 3, 1, NULL);
INSERT INTO products (id, name, idWriter, idGenre, idPublisher, idBookBinding, remark) VALUES (8, 'Горе от ума', 6, 7, 2, 1, NULL);
INSERT INTO products (id, name, idWriter, idGenre, idPublisher, idBookBinding, remark) VALUES (9, 'Евгений Онегин', 5, 1, 1, 1, NULL);
INSERT INTO products (id, name, idWriter, idGenre, idPublisher, idBookBinding, remark) VALUES (10, 'Гамлет', 4, 6, 3, 2, NULL);
INSERT INTO products (id, name, idWriter, idGenre, idPublisher, idBookBinding, remark) VALUES (11, 'Три сестры́', 3, 4, 3, 1, NULL);

-- Таблица: publishers
CREATE TABLE publishers (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, publisherName STRING NOT NULL, address STRING, country STRING, remark STRING);
INSERT INTO publishers (id, publisherName, address, country, remark) VALUES (1, 'Издательство «Центрполиграф»', 'Москва, ул. Энтузиастов, д.15', 'Россия', NULL);
INSERT INTO publishers (id, publisherName, address, country, remark) VALUES (2, '«Художественная литература»', 'Москва, ул. Новая Басманная, 19, стр. 1', 'Россия', NULL);
INSERT INTO publishers (id, publisherName, address, country, remark) VALUES (3, 'Издательство «Азбука»', 'Москва, ул. Павловская, д. 7.', 'Россия', NULL);
INSERT INTO publishers (id, publisherName, address, country, remark) VALUES (4, 'Издательство «Эксмо»', 'Краснодар ул. Сормовская, 7/6', 'Россия', NULL);
INSERT INTO publishers (id, publisherName, address, country, remark) VALUES (5, 'Издательская группа АСТ', 'бульвар Звёздный, д. 21 стр. 1 ком.', 'Россия', NULL);

-- Таблица: writers
CREATE TABLE writers (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name STRING (30) NOT NULL, surname STRING (40) NOT NULL, patronymic STRING (40), yearOfBirth INTEGER (4) NOT NULL, yearOfDeath INTEGER (4), country STRING, placeOfBirth STRING, remark STRING);
INSERT INTO writers (id, name, surname, patronymic, yearOfBirth, yearOfDeath, country, placeOfBirth, remark) VALUES (1, 'Лев', 'Толсто́й', 'Никола́евич', 1828, 1910, 'Россия', 'Ясная Поляна', 'один из наиболее известных русских писателей и мыслителей, один из величайших писателей-романистов мира');
INSERT INTO writers (id, name, surname, patronymic, yearOfBirth, yearOfDeath, country, placeOfBirth, remark) VALUES (2, 'Эрне́ст', 'Хемингуэ́й', 'Ми́ллер', 1899, 1961, 'США', 'Оук-Парке', 'американский писатель, военный корреспондент, лауреат Нобелевской премии по литературе 1954 года');
INSERT INTO writers (id, name, surname, patronymic, yearOfBirth, yearOfDeath, country, placeOfBirth, remark) VALUES (3, 'Анто́н', 'Че́хов', 'Па́влович', 1860, 1904, 'Таганрог', 'Таганрог', 'русский писатель, прозаик, драматург, публицист, врач, общественный деятель в сфере благотворительности. Классик мировой литературы. Почётный академик Императорской академии наук по разряду изящной словесности');
INSERT INTO writers (id, name, surname, patronymic, yearOfBirth, yearOfDeath, country, placeOfBirth, remark) VALUES (4, 'Уи́льям', 'Шекспи́р', NULL, 1564, 1616, 'Россия', 'Стратфорд-на-Эйвоне', 'английский поэт и драматург, зачастую считается величайшим англоязычным писателем и одним из лучших драматургов мира. Часто именуется национальным поэтом Англии');
INSERT INTO writers (id, name, surname, patronymic, yearOfBirth, yearOfDeath, country, placeOfBirth, remark) VALUES (5, 'Алекса́ндр', 'Пу́шкин', 'Серге́евич', 1799, 1837, 'Россия', 'Москва', 'русский поэт, драматург и прозаик, заложивший основы русского реалистического направления, литературный критик и теоретик литературы, историк, публицист, журналист; один из самых авторитетных литературных деятелей первой трети XIX века');
INSERT INTO writers (id, name, surname, patronymic, yearOfBirth, yearOfDeath, country, placeOfBirth, remark) VALUES (6, 'Алекса́ндр', 'Грибое́дов', 'Серге́евич', 1795, 1829, 'Россия', 'Москва', 'русский дипломат, поэт, драматург, пианист и композитор, дворянин. Статский советник');
INSERT INTO writers (id, name, surname, patronymic, yearOfBirth, yearOfDeath, country, placeOfBirth, remark) VALUES (7, 'Алекса́ндр', 'Блок', 'Алекса́ндрович', 1880, 1921, 'Россия', 'Санкт-Петербург', 'русский поэт, писатель, публицист, драматург, переводчик, литературный критик. Классик русской литературы XX столетия, один из крупнейших представителей русского символизма');
INSERT INTO writers (id, name, surname, patronymic, yearOfBirth, yearOfDeath, country, placeOfBirth, remark) VALUES (8, 'Афана́сий', 'Фет', 'Афана́сьевич', 1820, 1892, 'Россия', 'Мценск', 'русский поэт-лирик и переводчик, мемуарист, член-корреспондент Петербургской Академии Наук, прозаик');
INSERT INTO writers (id, name, surname, patronymic, yearOfBirth, yearOfDeath, country, placeOfBirth, remark) VALUES (9, 'А́нна', 'Ахма́това', 'Андре́евна', 1889, 1966, 'Украине', 'Большой Фонтан', 'поэтесса Серебряного века, переводчица и литературовед, одна из наиболее значимых фигур русской литературы XX века');
INSERT INTO writers (id, name, surname, patronymic, yearOfBirth, yearOfDeath, country, placeOfBirth, remark) VALUES (10, 'Дмитрий', 'Рус', NULL, 1975, NULL, 'Украина', 'Киев', 'Высшее образование получил на факультете «Математики и компьютерных наук». Некоторое время работал по специальности.

Дмитрий служил в армии, и целых два раза – в разных странах. Получил удостоверение «Снайпер СССР»');
INSERT INTO writers (id, name, surname, patronymic, yearOfBirth, yearOfDeath, country, placeOfBirth, remark) VALUES (11, 'Никола́й', 'Го́голь', 'Васи́льевич', 1809, 1852, 'Украина', 'Великие Сорочинцы', 'русский прозаик, драматург, критик, публицист, признанный одним из классиков русской литературы');
INSERT INTO writers (id, name, surname, patronymic, yearOfBirth, yearOfDeath, country, placeOfBirth, remark) VALUES (12, 'Фёдор', 'Достое́вский', 'Миха́йлович', 1821, 1881, 'Россия', 'Москва', 'русский писатель, мыслитель, философ и публицист. Член-корреспондент Петербургской академии наук с 1877 года');
INSERT INTO writers (id, name, surname, patronymic, yearOfBirth, yearOfDeath, country, placeOfBirth, remark) VALUES (13, 'Васи́ль', 'Бы́ков', 'Влади́мирович', 1924, 2003, 'Беларусь', 'Ушачский район', 'белорусский и советский писатель, общественный деятель, депутат Верховного Совета БССР 9—11 созывов, участник Великой Отечественной войны, член Союза писателей СССР');
INSERT INTO writers (id, name, surname, patronymic, yearOfBirth, yearOfDeath, country, placeOfBirth, remark) VALUES (14, 'Ким', 'Робинсон', 'Стенли', 1952, NULL, 'США', 'Уокиган', 'американский писатель-фантаст, возможно, наиболее известный своей Марсианской трилогией, удостоившейся нескольких премий');
INSERT INTO writers (id, name, surname, patronymic, yearOfBirth, yearOfDeath, country, placeOfBirth, remark) VALUES (15, 'Ду́глас', 'А́дамс', 'Но́эль', 1952, 2001, 'США', 'Монтесито, Калифорния', 'английский писатель, драматург и сценарист, автор юмористических фантастических произведений');

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
