---
title: "📊 Автоматизация учёта и аналитики реализаций проектов роадмапа"
date: 2025-02-15
weight: 2025-02-15
tags: ["Роадмап"]
---

# 📊 Автоматизация учёта и аналитики реализаций проектов роадмапа

2 года назад я начал фиксировать все сдаваемые проекты, чтобы копить коллекцию, делать ревью, вести статистику.

Первое время учёт вёлся вручную - я добавлял проекты в список на сайте роадмапа, и публиковал свежие проекты в итогах месяца.

Потом стал делегировать рутину, которая занимала 4-6 часов каждый месяц.

В этой статье я расскажу, как ручная обработка проектов постепенно была заменена на практически полную автоматизацию. Покажу исходники, данные, статистику и аналитику.

Стек решения:
- Бот - Python, python-telegram-bot, Docker
- Сайт роадмап - Hugo, Book, деплой через GitHub Actions
- Хранение данных и аналитика - Google Spreadsheets

Функционал:
- Каталогизация проектов и ревью
- Статистика по месяцам, языкам, типам проектов
- Аналитика по студентам

## Автоматизация и данные

На 16 февраля 2025, сдано 800 проектов на 13 языках программирования.

Когда кто-то публикует в [чате](https://telegram.me/zhukovsd_it_chat) свой готовый проект, я вызываю команду `/addproject $language $project`. [Бот сообщества](https://github.com/zhukovsd/it-mentor-community-bot/), написанный на Python и python-telegram-bot, сканирует сообщение на предмет ссылки на гитхаб, и добавляет проект в [Google таблицу](https://docs.google.com/spreadsheets/d/1E66YrdvO7B_j0Ykge-JJDMtB1RfKhIzN_SsO7UPDbrU/edit?gid=0#gid=0).

![1](/images/project-recording-automation/project-list.png)

Каждая строчка листа "Projects" описывает 1 проект - репозиторий, автора, язык.

[Pull request](https://github.com/zhukovsd/it-mentor-community-bot/pull/14) с реализацией (писал [@Asinim](https://telegram.me/Asinim)).

Эта информация используется для генерации списка свежих проектов за месяц (публикуется в конце месяца - [пример](https://telegram.me/zhukovsd_it_chat/1/147874)) и актуализации списка всех проектов на сайте роадмапа - [все реализации виселицы](https://zhukovsd.github.io/java-backend-learning-course/finished-projects/hangman/).

### Генерация списка свежих проектов

Суть проста - находим в Google таблице все проекты за текущий период, например, "Январь, 2025". По заданному формату генерируем Telegram сообщение со списком, где каждый элемент содержит тип проекта, язык, автора, ссылку на репозиторий.

По команде `/projectsmonthlysummary 'Декабрь, 2024'` бот исполняет эту операцию, и отправляет результат в ответном сообщении.

![2](/images/project-recording-automation/monthly-summary.png)

Задача - [https://github.com/zhukovsd/it-mentor-community-bot/issues/21](https://github.com/zhukovsd/it-mentor-community-bot/issues/21), pull request - [https://github.com/zhukovsd/it-mentor-community-bot/pull/29](https://github.com/zhukovsd/it-mentor-community-bot/pull/29).

Аналогичным образом работает генерация списка свежих ревью.

### Актуализация списка всех проектов и ревью на сайте роадмапа

Google таблица является исходным источником данных, с которыми удобно работать программно, но не очень удобно читать, особенно с телефона.

Поэтому, местом публикации списка реализаций всегда был сайт роадмапа - [https://zhukovsd.github.io/java-backend-learning-course/finished-projects/](https://zhukovsd.github.io/java-backend-learning-course/finished-projects/).

Изначально список обновлялся вручную в конце каждого месяца, потом генерацией markdown таблиц занимался бот. На днях мы доделали полную автоматизацию этого процесса.

- По команде `/updatefinishedprojects` бот итерирует проекты и ревью в Google таблице
- Собранные данные с помощью шаблонизатора Jinja2 и [шаблонов](https://raw.githubusercontent.com/zhukovsd/java-backend-learning-course/refs/heads/main/templates/hangman.md) рендерятся в markdown файл со списком реализаций в виде таблицы
- Обновленные таблицы пушатся ботом в новую ветку, автоматически создаётся pull request, [пример](https://github.com/zhukovsd/java-backend-learning-course/pull/57)

Остаётся вручную проверить и принять pull request, что запустит деплой на сайт.

- [Задача](https://github.com/zhukovsd/it-mentor-community-bot/issues/32)
- [Код](https://github.com/zhukovsd/it-mentor-community-bot/pull/34)

Над задачами по генерации работал [@krios2146](https://telegram.me/krios2146).

## Статистика

Сдаваемые проекты агрегируются для формирования статистики.

#### Проекты по языкам и типам

![3](/images/project-recording-automation/projects-by-language.png)

#### Проекты по месяцам

![4](/images/project-recording-automation/projects-by-month.png)

## Аналитика

Благодаря формулам Google таблиц можно добиться большего, чем простая агрегация статистики.

![5](/images/project-recording-automation/student-list.png)

[Список студентов](https://docs.google.com/spreadsheets/d/1E66YrdvO7B_j0Ykge-JJDMtB1RfKhIzN_SsO7UPDbrU/edit?gid=1733656936#gid=1733656936), сдавших хотя бы 1 проект. Собирается количество сданных проектов каждым, последний сданный проект и дата сдачи.

![6](/images/project-recording-automation/skipped-projects.png)

Проекты, которые пропускают чаще всего. Пропущенным считается проект, если студент написал хотя бы 1 проект до него, и хотя бы один после. Чаще всего пропускают виселицу (слишком просто), или планировщик задач (идут искать работу).

![7](/images/project-recording-automation/challenging-projects.png)

Проекты, на которых студенты сходят с дистанции - более 4 месяцев не публикуют свои новые проекты.

Не удивительно, что самый большой процент схода с дистанции у симуляции. Теннисное табло на втором месте.

## Планы на будущее

Автоматизация отлично помогает экономить время. Дальнейшая работа будут направлена на избавление от оставшейся рутины, прежде всего это ручной учёт ревью.