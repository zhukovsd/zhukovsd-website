---
title: "🎓 Обновление ТЗ проекта \"Облачное хранилище файлов\""
date: 2025-02-23
weight: 2025-02-23
tags: ["Роадмап"]
---

# 🎓 Обновление ТЗ проекта "Облачное хранилище файлов"

### Что поменялось

- Доступен готовый фронтенд, написанный на React
- Thymeleaf шаблоны заменены на REST API 
- В список технологий добавлен [Swagger](https://zhukovsd.github.io/java-backend-learning-course/projects/cloud-file-storage/#swagger)
- Добавлен [чеклист типовых ошибок](https://zhukovsd.github.io/java-backend-learning-course/projects/cloud-file-storage/#%D1%87%D0%B5%D0%BA%D0%BB%D0%B8%D1%81%D1%82-%D0%B4%D0%BB%D1%8F-%D1%81%D0%B0%D0%BC%D0%BE%D0%BF%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%BA%D0%B8)

### Готовый фронтенд на React

[Репозиторий фронтенда](https://github.com/zhukovsd/cloud-storage-frontend/)

Андрей [@MrShoffen](https://telegram.me/MrShoffen) реализовал React приложение, предоставляющее интерфейс для всего нужного по ТЗ функционала. В дополнение к этому, приложение имеет адаптивную вёрстку и тёмную тему.

Статические ресурсы скомпилированного React приложения удобно [интегрируются](https://zhukovsd.github.io/java-backend-learning-course/projects/cloud-file-storage/#%D0%B8%D0%BD%D1%82%D0%B5%D0%B3%D1%80%D0%B0%D1%86%D0%B8%D1%8F-%D1%84%D1%80%D0%BE%D0%BD%D1%82%D0%B5%D0%BD%D0%B4%D0%B0) в Spring Boot сервис.

Задеплоенная демка фронтенда — [cloud-storage-frontend/files](https://zhukovsd.github.io/cloud-storage-frontend/files/). API вызовы в задеплоенном приложении мокнуты, поэтому отображаемые данные являются фейковыми.

- [Главная страница](https://zhukovsd.github.io/cloud-storage-frontend/files/) с файлами корневой папки
- [Страница](https://zhukovsd.github.io/cloud-storage-frontend/files/mocked_folder1/) с файлами вложенной папки
- Для теста форм авторизации и регистрации необходимо нажать "выход" в меню пользователя

Благодаря этому готовый фронтенд доступен для всех проектов с 3 по 6.

### Thymeleaf шаблоны заменены на REST API

[Описание](https://zhukovsd.github.io/java-backend-learning-course/projects/cloud-file-storage/#rest-api) схемы REST API со всеми методами, форматами запросов и ответов.

Это изменение напрашивалось, но было невозможным без качественного фронтенда. Поэтому, с его появлением ТЗ проекта переписано под REST API, как более типовой и релевантный опыт в коммерческой разработке.

К REST API [добавлен](https://zhukovsd.github.io/java-backend-learning-course/projects/cloud-file-storage/#swagger) Swagger, с помощью которого необходимо документировать API.

{{< tags >}}
