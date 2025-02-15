---
title: "🎓 Мои пет проекты"
date: 2023-08-22
weight: 2023-08-22
tags: ["Статьи"]
---

# 🎓 Мои пет проекты

Воскресил и задеплоил свои 3 самых больших пет проекта, написанных в период с 2015 по 2018:

- Генератор лабиринтов - http://maze-generator.zhukovsd.com/
- Многопользовательский онлайн сапёр - http://online-minesweeper.zhukovsd.com/ (интерфейс не адаптирован под мобильные браузеры)
- Тест на скорость печати - http://typing-test.zhukovsd.com/

## Генератор лабиринтов

- http://maze-generator.zhukovsd.com/  
- Код - https://github.com/zhukovsd/maze-generator

TODO картинка

Генератор лабиринтов - мой первый серьёзный проект на Java, писал его в 2015 году, параллельно работе Delphi разработчиком.

Стек:

- Java 8
- Java Servlets, Tomcat
- HTML/CSS/JS

Запустить локально:

```
docker container run -p 80:8080 zhukovsd/maze-generator:latest
```

---

Цели, которые я перед собой ставил:

- Поглубже разобраться с Java Core, особенно с дженериками
- Написать простейший веб-интерфейс с бэкендом на сервлетах

Составные части проекта:

- Написанная с нуля [библиотека](https://github.com/zhukovsd/maze-generator/tree/master/src/main/java/com/zhukovsd/graphs), реализующая работу с графами
- [Генератор](https://github.com/zhukovsd/maze-generator/tree/master/src/main/java/com/zhukovsd/generator) лабиринтов, как прикладное применение библиотеки графов
- [Сервлет](https://github.com/zhukovsd/maze-generator/tree/master/src/main/java/com/zhukovsd/servlet) и [веб-интерфейс](https://github.com/zhukovsd/maze-generator/tree/master/src/main/webapp)

---

Идея проекта основана на том, что лабиринт можно представить в виде графа, как и процесс его генерации реализовать на основе графов:

- Граф изначальных комнат лабиринта
- Граф всевозможных перемещений между соседними комнатами
- Случайно сгенерированный граф пути без циклов, затрагивающий каждую комнату только 1 раз
- Граф кратчайшего пути

Более подробно я описывал все шаги генерации в своей [статье](https://github.com/zhukovsd/maze-generator/wiki/How-it-works-(ru)).

Интересные решенные проблемы:

- [Алгоритм](https://github.com/zhukovsd/maze-generator/blob/master/src/main/java/com/zhukovsd/graphs/subgraphs/SubGraph.java#L64) генерации остовного дерева в графе, и 2 алгоритма поиска пути - [Дейкстры](https://github.com/zhukovsd/maze-generator/blob/master/src/main/java/com/zhukovsd/graphs/subgraphs/SubGraph.java#L111) и [поиск в ширину](https://github.com/zhukovsd/maze-generator/blob/master/src/main/java/com/zhukovsd/graphs/subgraphs/SubGraph.java#L186)
- [Генерация лабиринта](https://github.com/zhukovsd/maze-generator/blob/master/src/main/java/com/zhukovsd/generator/Maze.java#L171-L180), как последовательная генерация графов разных типов

Если оценивать качество этого проекта с высоты текущего опыта, то библиотека графов, в целом, написана чисто, сервлет написан слабовато.

## Многопользовательский онлайн сапёр

- http://online-minesweeper.zhukovsd.com/ (интерфейс не адаптирован под мобильные браузеры)
- Код - https://github.com/zhukovsd/online-minesweeper, https://github.com/zhukovsd/endless-field

TODO картинка

Второй проект - многопользовательский онлайн-сапёр на условно-бесконечном поле. Писал в 2016.

Условно-бесконечность означает, что поле генерится блоками 50х50. Блоки генерируются в момент первого обращения к ним. Теоретический максимальный размер поля - 40000х40000 блоков, каждый по 2500 ячеек, 4*10^12 ячеек.

На практике, память сервера кончится быстрее, чем получится сгенерировать даже малую долю максимально возможного поля.

Смысл многопользовательности - все игроки играют на общем поле, действия, сделанные одним игроком, рассылаются остальным, кто видит эту же часть карты.

Стек:

- Java 8
- Java Servlets, WebSockets, Tomcat, без фреймворков
- HTML/CSS, JS

Запустить локально:

```
docker container run -p 80:8080 zhukovsd/online-minesweeper:latest
```

---

Цели, которые я перед собой ставил:

- Попрактиковаться с многопоточностью
- Реализовать real-time веб-приложение с помощью WebSocket

В этом проекте я набил шишек оверинжиниринга. Составные части:

- Самописный фреймворк, реализующий [условно-бесконечное поле](https://github.com/zhukovsd/endless-field/tree/886b4c8d14b913d0e8f2a916646762dfe863aa71/src/main/java/com/zhukovsd/endlessfield/field), [работу с блокировками](https://github.com/zhukovsd/endless-field/tree/886b4c8d14b913d0e8f2a916646762dfe863aa71/src/main/java/com/zhukovsd/entrylockingconcurrenthashmap), работу с [HTTP и WebSocket](https://github.com/zhukovsd/endless-field/tree/886b4c8d14b913d0e8f2a916646762dfe863aa71/src/main/java/com/zhukovsd/serverapp), [основу](https://github.com/zhukovsd/endless-field/tree/886b4c8d14b913d0e8f2a916646762dfe863aa71/src/main/webapp/js) для построения веб-интерфейса 
- [Онлайн сапёр](https://github.com/zhukovsd/online-minesweeper), как применение самописного фреймворка

---

Сердце проекта - потокобезопасная коллекция, реализующая доступ к блокам карты. Действия на карте требуют блокировки этих блоков, пока клик одного пользователя обрабатываются, другие ждут. В то же время, действия пользователя на одной части карты не должны блокировать действия пользователей в других областях.

Подход к потокобезопасности основан на [lock striping](https://www.baeldung.com/java-lock-stripping).

Интересные решённые проблемы:

- Клик на клетку в сапёре может привести к открытию целой группы клеток. Мы делаем допущение, что этот эффект не может распространиться дальше, чем текущий блоков, и его уже сгенерированные соседи - иначе мы бы не знали, сколько блоков нужно заблокировать для обработки действия пользователя. Чтобы исполнить это требование, расстановка мин внутри блока проходит [валидацию](https://github.com/zhukovsd/online-minesweeper/blob/dev/src/main/java/com/zhukovsd/minesweeperfield/MinesweeperFieldChunkFactory.java#L169). Для расчёта группы клеток, которая откроется при клике, применена библиотека графов, написанная для проекта с лабиринтами
- Динамически [определяем](https://github.com/zhukovsd/endless-field/blob/886b4c8d14b913d0e8f2a916646762dfe863aa71/src/main/java/com/zhukovsd/serverapp/endpoints/websocket/ActionEndpoint.java#L168), каким пользователям нужно доставить сообщения по WebSocket об изменениях на конкретных блоках

В целом, проект сложный и интересный, есть над чем подумать. К сожалению, мотивации полноценно закончить его я не нашёл, поэтому в нём осталось много недоделанных TODO и код не особо отполирован. Но свою основную цель я закрыл - узнал много нового про многопоточность.

Если бы писал этот же проект сейчас с целью его реального применения - для хранения состояния поля использовал бы базу данных, а не коллекцию в памяти.

## Тест на скорость печати

- http://typing-test.zhukovsd.com/
- Код - https://github.com/zhukovsd/typing-test

TODO картинка

Простой 60-секундный тест на скорость печати.

Стек:

- Бэк - Kotlin, Spring Boot, Redis
- Фронт - JS 2015 (ES6), Pug.js, Webpack, без фреймворков
- DevOps/Деплой - Docker, Docker Compose, Docker Swarm, CircleCI

Запустить локально:

- Склонировать репозиторий https://github.com/zhukovsd/typing-test
- `docker compose -f docker-compose-dev.yml up`

---

Писал проект в 2018, цели:

- Попробовать Kotlin
- Написать относительно сложный динамический фронт на JS 2015 (в котором есть нормальная поддержка ООП)
- Разобраться в Docker и Docker Swarm (Swarm в настоящее время почти полностью вытеснен Kubernetes)
- Реализовать автоматический деплой с помощью CircleCI

Интересные решённые проблемы:

- [Компонент](https://github.com/zhukovsd/typing-test/blob/master/frontend/app/js/UI/WordsContainer.js) для отображения списка слов для пользователя. Автоматически скроллится вверх и вниз, в зависимости от позиции каретки, подсвечивает правильный и неправильный ввод цветами
- [Компонент](https://github.com/zhukovsd/typing-test/blob/master/frontend/app/js/UI/Statistics/Speedometer.js) для отображения текущей скорости ввода текста, стилизованный под спидометр

Бэк простой - сохраняет результат теста в БД (Redis), и вычисляет top-% (например - "вы печатаете быстрее, чем 80% человек) результата теста на основе взятой извне [статистики](https://github.com/zhukovsd/typing-test/blob/master/src/main/resources/placements.data).

Итоговый стек из двух сервисов задеплоен в облако Hetzner на кластер из двух нод, где и работает по сей день.