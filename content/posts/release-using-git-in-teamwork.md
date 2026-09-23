---
title: "👩‍💻 Релиз воркшопа по использованию git в командной работе"
date: 2026-09-21
weight: 2026-09-21
tags: ["Воркшоп", "Git"]
---

# 👩‍💻 Релиз воркшопа по использованию git в командной работе

http://git-workshop.zhukovsd.it/

### Суть

Если посмотреть на десятки людей, идущих по маршруту роадмап→менторство→трудоустройство, и составить список возникающих у них трудностей, то технологии и написания кода не будут на первом месте.

Первые 2 позиции в этом списке займут работа с git и коммуникация с командой.

Воркшоп создан, чтобы помочь подготовиться к использованию git в рабочих проектах, не бояться пул реквестов, падающих пайплайнов, работы с ветками и конфликтами.

### Что внутри

8 кейсов, в каждом из которых вы получаете практический навык решения типовой проблемы из командой работы.

Каждый кейс оформлен в виде GitHub репозитория. Описание и инструкции по решению описаны в `README.md` каждого репозитория.

Решать можно в произвольном порядке.

#### Pull Request’ы и пайплайны

- Создание пул реквеста и прогон CI/CD пайплайна - https://github.com/zhukovsd/git-workshop-creating-pull-request

#### Конфликты

- Решение Git конфликтов для приёма pull request и прохождения тестов, пайплайна - https://github.com/zhukovsd/git-workshop-resolving-conflicts
- Cherry-pick с решением конфликтов https://github.com/zhukovsd/git-workshop-cherry-pick

#### Изменение истории ветки

- Слияние/удаление по ошибке сделанных коммитов
https://github.com/zhukovsd/git-workshop-squashing-commits
- Изменение сообщений и автора коммитов https://github.com/zhukovsd/git-workshop-changing-commit-messages-and-author
- Удаление секретного ключа из истории коммитов - https://github.com/zhukovsd/git-workshop-removing-credentials-from-history
- Удаление секретного файла из истории коммитов https://github.com/zhukovsd/git-workshop-removing-file-from-history
- Разбиение большого коммита на несколько маленьких https://github.com/zhukovsd/git-workshop-splitting-commit
