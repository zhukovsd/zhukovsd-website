---
title: "📕 Обновление сайта роадмапа"
date: 2024-07-24
weight: 2024-07-24
tags: ["Роадмап"]
---

# 📕 Обновление сайта роадмапа

https://zhukovsd.github.io/java-backend-learning-course/

TL;DR - навигация, поиск, темная тема.

Для написания материалов роадмапа я использую GitHub - это позволяет писать статьи в Markdown, принимать правки через пул реквесты.

Для чтения GitHub не идеален, поэтому с самого начала работы над роадмапом я пользовался [GitHub Pages](https://pages.github.com/) - сервисом от GitHub для размещения статических ресурсов на домене github.io.

Он позволяет рендерить Markdown в HTML с помощью Jekyll и деплоить их на gh pages, используя CI/CD сервис GitHub Actions.

### Что нового

Благодаря миграции с Jekyll на Hugo появилась возможность повысить удобство сайта:

- Навигация по страницам и параграфам страниц
- Поиск
- Светлая и темная темы

### Техническая реализация

За идею и реализацию спасибо [@krios2146](https://telegram.me/krios2146).

- Хостинг [GitHub Pages](https://pages.github.com/), автоматизация через GitHub Actions
- Генератор статических сайтов [Hugo](https://gohugo.io/)
- Тема для Hugo - [Book](https://github.com/alex-shpak/hugo-book/tree/7c26d9b8b731d556a2bf89848f59e8300eabc44b)
- Конфиг Hugo, структуру проекта, GitHub Action для автоматизации сборки и деплоя можно посмотреть в [пул реквесте](https://github.com/zhukovsd/java-backend-learning-course/pull/34)

---

Аналогичная миграция в ближайшее время сделана для [Python версии роадмапа](https://zhukovsd.github.io/python-backend-learning-course/).

{{< tags >}}