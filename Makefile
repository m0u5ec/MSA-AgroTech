# Ищем все .puml файлы в проекте и меняем их расширение на .png для целевых файлов
PUML_FILES := $(shell find . -name "*.puml")
PNG_FILES  := $(PUML_FILES:.puml=.png)

# Главная цель: собрать все картинки
all: $(PNG_FILES)

# Правило для генерации конкретного .png из конкретного .puml
%.png: %.puml
	java -jar plantuml.jar -pipe < "$<" > "$@"

# Очистка сгенерированных картинок (опционально)
clean:
	find . -name "*.png" -type f -delete

.PHONY: all clean
