#папка
mkdir -p data local_data

case "$1" in
    build_generator)
        echo "сборка образа генератора..."
        docker build -t data-generator ./generator
        echo "готово"
        ;;
    
    run_generator)
        echo "запуск генератора..."
        docker run --rm -v "$(pwd)/data:/data" data-generator
        echo "файл создан: data/data.csv"
        ;;
    
    create_local_data)
        echo "создание данных для отладки локально..."
        docker run --rm -v "$(pwd)/local_data:/data" data-generator
        echo "данные: local_data/data.csv"
        ;;
    
    build_reporter)
        echo "сборка образа аналитика..."
        docker build -t data-reporter ./reporter
        echo "готово"
        ;;
    
    run_reporter)
        echo "запуск аналитика..."
        docker run --rm -v "$(pwd)/data:/data" data-reporter
        echo "отчет создан: data/report.html"
        ;;
    
    structure)
        echo "структура проекта:"
        find . -type f -not -path "./.git/*" -not -name ".*" | sort
        ;;
    
    clear_data)
        echo "очистка папки data..."
        rm -f data/*.csv data/*.html
        echo "папка очищена"
        ;;
    
    inside_generator)
        echo "содержимое /data внутри контейнера генератора:"
        docker run --rm -v "$(pwd)/data:/data" data-generator ls -la /data
        ;;
    
    inside_reporter)
        echo "содержимое /data внутри контейнера аналитика:"
        docker run --rm -v "$(pwd)/data:/data" data-reporter ls -la /data
        ;;
    
    *)
        echo "Ошибка: '$1' - неизвестная команда"
        echo "Используйте: build_generator, run_generator, create_local_data, build_reporter, run_reporter, structure, clear_data, inside_generator, inside_reporter"
        exit 1
        ;;
esac