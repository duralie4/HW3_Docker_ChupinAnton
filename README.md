# HW3_Docker_ChupinAnton

Проект из двух контейнеров: генератор CSV-данных и аналитик, строящий HTML-отчёт.
Данные хранятся на хосте в папке data/ и монтируются в контейнеры.

## Команды

./run.sh build_generator    # собрать образ генератора
./run.sh run_generator      # сгенерировать data/data.csv
./run.sh create_local_data  # создать local_data/data.csv для локальной отладки
./run.sh build_reporter     # собрать образ аналитика
./run.sh run_reporter       # построить data/report.html
./run.sh structure          # структура проекта
./run.sh clear_data         # очистить data/
./run.sh inside_generator   # содержимое /data глазами контейнера генератора
./run.sh inside_reporter    # содержимое /data глазами контейнера аналитика

## Просмотр отчёта

После run_reporter в data/ появляется report.html.
Скачайте файл и откройте в браузере (или через онлайн-просмотрщик HTML).