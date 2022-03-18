### Простой магазин на JavaScript

![Простой магазин на JavaScript](https://tokmakov.msk.ru/files/blog/664/shop.gif)

1. [Серверное приложение, база данных, ORM Sequelize](https://tokmakov.msk.ru/blog/item/664)
2. [Обрабатываем HTTP запросы, добавляем маршруты](https://tokmakov.msk.ru/blog/item/665)
3. [Добавляем классы контроллеров, обработка ошибок](https://tokmakov.msk.ru/blog/item/666)
4. [CRUD для категорий и товаров, загрузка изображений](https://tokmakov.msk.ru/blog/item/667)
5. [Создание моделей, фильтрация по категрии и бренду](https://tokmakov.msk.ru/blog/item/668)
6. [Пагинация, свойства товара, JWT (JSON Web Token)](https://tokmakov.msk.ru/blog/item/669)
7. [Регистрация и авторизация, права пользователей, тесты](https://tokmakov.msk.ru/blog/item/670)
8. [Работа со свойствами товара и корзиной покупателя](https://tokmakov.msk.ru/blog/item/671)
9. [Рейтинг товара, приложение клиента, структура проекта](https://tokmakov.msk.ru/blog/item/672)
10. [Маршруты, панель навигации, контекст приложения](https://tokmakov.msk.ru/blog/item/673)
11. [Компоненты Signup и Login, компоненты Shop и Basket](https://tokmakov.msk.ru/blog/item/679)
12. [Запросы на сервер, состояние приложения, Signup и Login](https://tokmakov.msk.ru/blog/item/680)
13. [Хранилище каталога, компонент витрины, кнопка «Назад»](https://tokmakov.msk.ru/blog/item/681)
14. [Кнопка «Назад», страница товара, корзина покупателя](https://tokmakov.msk.ru/blog/item/682)
15. [Работа с заказами на сервере, оформление заказа](https://tokmakov.msk.ru/blog/item/683)
16. [Личный кабинет, список заказов и отдельный заказ](https://tokmakov.msk.ru/blog/item/684)
17. [Панель управления: список заказов, категорий и брендов](https://tokmakov.msk.ru/blog/item/685)
18. [Панель управления: редактирование категорий и брендов](https://tokmakov.msk.ru/blog/item/686)
19. [Редактирование характеристик и рефакторинг приложения](https://tokmakov.msk.ru/blog/item/687)

Чтобы развернуть проект, клонируем этот репозиторий к себе на компьютер, в директорию `shop`

```
git clone git@github.com:tokmakov/javascript-shop.git shop
```

Создаем базу данных с помощью утилиты `psql`

```
/path/to/postgre/bin/psql -U postgres
Пароль: qwerty

postgres=# CREATE DATABASE online_store;

postgres=# \q
```

Имя БД и логин-пароль прописывам в `server/.env`

```
DB_HOST=localhost
DB_NAME=online_store
DB_USER=postgres
DB_PASS=qwerty
DB_PORT=5432
```

Переходим в директорию `shop/server`, устанавливаем пакеты, запускаем сервер

```
cd /path/to/shop/server
npm install
npm run start-dev
```

Переходим в директорию `shop/client`, устанавливаем пакеты, запускаем клиент

```
cd /path/to/shop/client
npm install
npm start
```

#### Примечания

Таблицы базы данных будут созданы при первом запуске приложения, но они будут пустыми. Можно импортировать базу данных из файла `database.sql`, в которой уже есть категории, бренды, товары, пользователи и т.д.


```
/path/to/postgre/bin/psql -U postgres online_store < /path/to/shop/database.sql
Пароль: qwerty
```

Здесь `postgres` — имя пользователя БД, `qwerty` — пароль для доступа к БД, `online_store` — имя базы данных магазина.

---

Дамп базы данных `database.sql` был создан с помощью утилиты `pg_dump` на заключительном этапе разработки магазина

```
/path/to/postgre/bin/pg_dump -U postgres online_store > /path/to/shop/database.sql
Пароль: qwerty
```

Здесь `postgres` — имя пользователя БД, `qwerty` — пароль для доступа к БД, `online_store` — имя базы данных магазина.

---

Список баз данных можно посмотреть, если запустить утилиту `psql` и выполнить SELECT-запрос

```
/path/to/postgre/bin/psql -U postgres
Пароль: qwerty

postgres=# SELECT datname FROM pg_database;

datname
-----------------
postgres
online_store
template1
template0

postgres=# \q
```

---

Дамп базы данных содержит несколько пользователей, как обычных, так и с правами администратора

* Пользователь `user@mail.ru`, пароль `qwerty`
* Пользователь `admin@mail.ru`, пароль `qwerty`

