import re
import subprocess
import os
from typing import List, Optional


class PrologQueryProcessor:
    def __init__(self, prolog_file: str = "script1.pl"):
        self.prolog_file = prolog_file
        self.queries_map = {
            "женат": "spouse",
            "замужем": "spouse",
            "холост": "bachelor",
            "незамужем": "bachelorette",
            "умер": "dead",
            "родился": "born",
            "родитель": "parent",
            "возраст": "age",
            "сиблинги": "siblings",
            "братья сестры": "siblings",
            "бабушка дедушка": "grandparent",
            "взрослый": "adult",
            "жив в году": "alive_in_year",
            "сирота": "orphan_in_year",
            "родитель одиночка": "single_parent_in_year",
            "дядя тетя": "aunt_or_uncle",
            "предок": "ancestor",
            "потомок": "descendant",
            "двоюродные": "cousins",
            "зять": "son_in_law",
            "невестка": "daughter_in_law",
            "свекровь тесть": "parent_in_law",
        }

    def parse_query(self, query: str) -> Optional[str]:
        """Парсит введенный запрос и преобразует в Prolog-запрос"""
        query = query.strip()
        print(query)

        for keyword, prolog_predicate in self.queries_map.items():
            if keyword in query:
                # Извлекаем имя человека из запроса
                name_match = re.search(r'[А-Я][а-я]+s+[А-Я][а-я]+(?:s+[А-Я][а-я]+)?', query)
                print(name_match)

                if name_match:
                    name = name_match.group(0)
                    # Для предикатов с одним аргументом
                    if prolog_predicate in ["spouse", "bachelor", "bachelorette", "dead", "born",
                                            "age", "siblings", "adult", "orphan_in_year"]:
                        return f"{prolog_predicate}('{name}', Result)"

                # Для предикатов с двумя именами
                names = re.findall(r'[А-ЯЁ][а-яё]+s+[А-ЯЁ][а-яё]+(?:s+[А-ЯЁ][а-яё]+)?', query)
                if len(names) == 2:
                    if prolog_predicate in ["parent", "grandparent", "aunt_or_uncle",
                                            "ancestor", "descendant", "cousins",
                                            "son_in_law", "daughter_in_law", "parent_in_law"]:
                        return f"{prolog_predicate}('{names[0]}', '{names[1]}', Result)"

                # Для предикатов с годом
                year_match = re.search(r'\b(19|20)d{2}\b', query)
                if year_match:
                    year = year_match.group(0)
                    if name_match:
                        name = name_match.group(0)
                        if prolog_predicate in ["alive_in_year", "single_parent_in_year"]:
                            return f"{prolog_predicate}('{name}', {year}, Result)"

        return None

    def execute_prolog_query(self, prolog_query: str) -> List[str]:
        """Выполняет Prolog-запрос и возвращает результаты"""
        try:
            # Создаем временный файл с запросом
            with open("temp_query.pl", "w", encoding="utf-8") as f:
                f.write(f":- consult('{self.prolog_file}').\n")
                f.write(f":- {prolog_query}, write(Result), nl, fail; true.\n")

            # Выполняем Prolog-запрос
            result = subprocess.run([
                "swipl", "-q", "-f", "temp_query.pl"
            ], capture_output=True, text=True, encoding="utf-8", timeout=30)

            # Удаляем временный файл
            try:
                if os.path.exists("temp_query.pl"):
                    os.remove("temp_query.pl")
            except:
                pass

            if result.returncode == 0 and result.stdout.strip():
                # Обрабатываем результаты
                lines = [line.strip() for line in result.stdout.strip().split('\n')
                         if line.strip() and not line.startswith('Warning')]
                return lines if lines else ["Информация не найдена"]
            else:
                return ["Не удалось найти информацию по запросу"]

        except subprocess.TimeoutExpired:
            return ["Запрос выполняется слишком долго"]
        except Exception as e:
            return [f"Ошибка выполнения запроса: {str(e)}"]

    def process_query(self, user_query: str) -> str:
        """Обрабатывает пользовательский запрос и возвращает ответ"""
        print(f"Обрабатываем запрос: {user_query}")  # Для отладки

        prolog_query = self.parse_query(user_query)
        print(f"Сформированный Prolog запрос: {prolog_query}")  # Для отладки

        if not prolog_query:
            return "Не могу понять ваш запрос. Попробуйте сформулировать иначе."

        results = self.execute_prolog_query(prolog_query)
        print(f"Результаты выполнения: {results}")  # Для отладки

        if results:
            return "\n".join(results)
        else:
            return "Информация не найдена."


def main():
    processor = PrologQueryProcessor("script1.pl")

    print("Система вопросов о семейных отношениях")
    print("Доступные типы запросов:")
    print("- Информация о человеке (женат/холост/умер/родился)")
    print("- Возраст человека")
    print("- Родственные связи (родитель, сиблинги, бабушка/дедушка)")
    print("- Семейные отношения (зять, невестка, двоюродные)")
    print("- Исторические данные (жив в году, сирота)")
    print("Пример: 'Сколько лет Владимиру Павловичу Шуст?'")
    print("Для выхода введите 'выход'")

    while True:
        try:
            user_input = input("\nВаш вопрос: ").strip()

            if user_input.lower() in ['выход', 'exit', 'quit']:
                print("До свидания!")
                break

            if not user_input:
                continue

            response = processor.process_query(user_input)
            print(f"Ответ: {response}")

        except KeyboardInterrupt:
            print("\nДо свидания!")
            break
        except Exception as e:
            print(f"Произошла ошибка: {e}")


if __name__ == "__main__":
    main()
