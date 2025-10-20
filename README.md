# AIS | Module 1 | Шуст Марья | P3311

---

# Введение

## Лабораторная работа №1

### Цель

> Создание базы знаний в языке программирования Prolog и реализовывание набора запросов, используя созданную базу
> знаний. Получить и развить навыков работы с фактами, предикатами, и правилами в логическом программировании.

## Лабораторная работа №2

### Цель

> Познакомиться со средой разработки онтологий Protege и перевод базы знаний, созданной в предыдущей лабораторной работе
> в онтологическую форму в Protege.

# Анализ требований

## Лабораторная работа №1

### Требования и задачи

### Часть 1

- **Cоздание базы знаний:**

  Создайте базу знаний. База знаний должна включать в себя **не менее 20 фактов с одним аргументом, 10-15 фактов с двумя
  аргументам, которые дополняют и показывают связь с другими фактами и 5-7 правил.** Факты могут описывать объекты, их
  свойства и отношения между ними. Факты 2 и более аргументами могут описывать различные атрибуты объектов, а правила -
  логические законы и выводы, которые можно сделать на основе фактов и предикатов.

- **Выполнение запросов:**

  Напишите несколько запросов для БЗ. Запросы **должны быть разной сложности** и включать в себя:

    - Простые запросы к базе знаний для поиска фактов.
    - Запросы, использующие логические операторы (**и, или, не**) для формулирования сложных условий (или использовать
      логические операторы в правилах).
    - Запросы, использующие переменные для поиска объектов с определенными характеристиками.
    - Запросы, которые требуют выполнения правил для получения результата.
- **Документация:**

  В коде должны быть комментарии описания фактов, предикатов и правил.

### Часть 2

- **Задание**

  Преобразовать факты и отношения из Prolog в концепты и свойства в онтологии. Описать классы и свойства в онтологии,
  которые соответствуют объектам и отношениям из базы знаний. Например, если у были классы "Человек" и "Машина" и
  свойство "возраст", создайте аналогичные классы и свойства в онтологии в Protege.

## Лабораторная работа №2

### Требования и задачи

- **Задание**
    - Создать программу, которая позволяет пользователю ввести запрос через командную строку. Например, информацию о
      себе, своих интересах и предпочтениях в контексте выбора видеоигры - на основе фактов из БЗ (из первой лабы)
      /Онтологии(из второй).
    - Использовать введенные пользователем данные, чтобы выполнить логические запросы к БЗ/Онтологии.
    - На основе полученных результатов выполнения запросов, система должна предоставить рекомендации или советы,
      связанные с выбором из БЗ или онтологии.
    - Система должна выдавать рекомендации после небольшого диалога с пользователем.
- **Нужно**

  Спарсить строку, разбить на факты, построить запрос, используя эти предикаты. *(Формат входной строки фиксированный,
  искать частичное соответсвие подстроки не нужно)*

# Лабораторная работа №1

## Изучение основных концепций и инструментов

В ходе выполнения лабораторной работы я изучила [методическое пособие](https://books.ifmo.ru/file/pdf/3308.pdf) по
“Системам Искусственного Интелекта”, а точнее весь первый модуль. Узнала, что такое `Базы Знаний` , `Онтологии` ,
`Prolog` и `Protege` , а дальше начала выполнять первую лабораторную работу

## Ход работы

### Prolog 

```prolog

% Married characters
married("Владимир Павлович Шуст").
married("Татьяна Петровна Шуст").
married("Иван Владимирович Шуст").
married("Арина Александровна Шуст").
married("Елена Петровна Исмаилова").
married("Дмитрий Дмитриевич Исмаилов").
married("Антонина Павловна Адамова").
married("Петр Михаилович Адамов").
married("Варвара Игнатова Адамова").
married("Михаил Григорьевич Адамов").
married("Игорь Александрович Федоров").
married("Алла Павловна Федорова").
married("Евгения Евдокимовна Шуст").
married("Павел Дмитриевич Шуст").
married("Елизавета Карловна Шуст").
married("Дмитрий Константинович Шуст").
married("Даниил Карлович Куранов").
married("Дарья Владимировна Куранова").
married("Карл Куранов").
married("Валентина Сергеевна Куранова").
married("Ярослав Владимирович Белый").
married("Захар Иванович Курдюков").
married("Ярослав Владимирович Белый").
married("Захар Иванович Курдюков").

% Bachelors
bachelor("Николай Михаилович Адамов").
bachelor("Сергей Игоревич Федоров").
bachelor("Кирилл Игоревич Федоров").
bachelor("Эльчин Дмитриевич Исмаилов").
bachelor("Леонид Даниилович Куранов").

% Bachelorettes
bachelorette("Алена Михайловна Адамова").
bachelorette("Марья Владимировна Шуст").
bachelorette("Екатерина Данииловна Куранова").
bachelorette("Анна Игоревна Федорова").

% Spouse relationships 
spouse("Варвара Игнатова Адамова", "Михаил Григорьевич Адамов", date(15, 03, 1949)).
spouse("Антонина Павловна Адамова", "Петр Михаилович Адамов", date(11, 11, 1972)).
spouse("Елена Петровна Исмаилова", "Дмитрий Дмитриевич Исмаилов", date(03, 09, 1999)).
spouse("Татьяна Петровна Шуст", "Владимир Павлович Шуст", date(24, 08, 1996)).
spouse("Арина Александровна Шуст", "Иван Владимирович Шуст", date(31, 07, 2024)).
spouse("Алла Павловна Федорова", "Игорь Александрович Федоров", date(20, 08, 1988)).
spouse("Евгения Евдокимовна Шуст", "Павел Дмитриевич Шуст", date(08, 09, 1970)).
spouse("Елизавета Карловна Шуст", "Дмитрий Константинович Шуст", date(30, 05, 1938)).
spouse("Валентина Сергеевна Куранова", "Карл Куранов", date(23, 06, 1926)).
spouse("Валентина Сергеевна Куранова", "Ярослав Владимирович Белый", date(08, 07, 1921)).
spouse("Дарья Владимировна Куранова", "Даниил Карлович Куранов", date(03, 07, 1946)).
spouse("Дарья Владимировна Куранова", "Захар Иванович Курдюков", date(03, 07, 1939)).

% Dead
dead("Ярослав Владимирович Белый", date(10, 10, 1923)).
dead("Антонина Павловна Адамова", date(09, 05, 2000)).
dead("Петр Михаилович Адамов", date(15, 04, 2020)).
dead("Варвара Игнатова Адамова", date(21, 04, 2004)).
dead("Михаил Григорьевич Адамов", date(14, 01, 2005)).
dead("Евгения Евдокимовна Шуст", date(16, 06, 2009)).
dead("Павел Дмитриевич Шуст", date(27, 05, 2021)).
dead("Екатерина Данииловна Куранова", date(13, 07, 2006)).
dead("Леонид Даниилович Куранов", date(17, 01, 2013)).
dead("Елизавета Карловна Шуст", date(18, 03, 2001)).
dead("Дмитрий Константинович Шуст", date(15, 01, 1999)).
dead("Даниил Карлович Куранов", date(03, 08, 2003)).
dead("Дарья Владимировна Куранова", date(13, 09, 2008)).
dead("Захар Иванович Курдюков", date(2, 09, 1941)).
dead("Карл Куранов", date(29, 03, 1950)).
dead("Валентина Сергеевна Куранова", date(01, 08, 1973)).

% Born
born("Ярослав Владимирович Белый", date(07, 09, 1881)).
born("Захар Иванович Курдюков", date(02, 03, 1905)).
born("Николай Михаилович Адамов", date(31, 12, 1955)).
born("Сергей Игоревич Федоров", date(11, 09, 1986)).
born("Кирилл Игоревич Федоров", date(16, 07, 1994)).
born("Эльчин Дмитриевич Исмаилов", date(02, 02, 2000)).
born("Леонид Даниилович Куранов", date(18, 03, 1939)).
born("Алена Михайловна Адамова", date(07, 04, 1957)).
born("Марья Владимировна Шуст", date(17, 07, 2005)).
born("Екатерина Данииловна Куранова", date(24, 06, 1934)).
born("Анна Игоревна Федорова", date(12, 03, 1991)).
born("Владимир Павлович Шуст", date(03, 09, 1971)).
born("Татьяна Петровна Шуст", date(16, 11, 1973)).
born("Иван Владимирович Шуст", date(17, 09, 1999)).
born("Арина Александровна Шуст", date(17, 08, 1999)).
born("Елена Петровна Исмаилова", date(24, 09, 1978)).
born("Дмитрий Дмитриевич Исмаилов", date(15, 03, 1976)).
born("Антонина Павловна Адамова", date(20, 09, 1952)).
born("Петр Михаилович Адамов", date(21, 11, 1955)).
born("Варвара Игнатова Адамова", date(03, 05, 1929)).
born("Михаил Григорьевич Адамов", date(20, 06, 1929)).
born("Игорь Александрович Федоров", date(27, 01, 1965)).
born("Алла Павловна Федорова", date(20, 09, 1967)).
born("Евгения Евдокимовна Шуст", date(20, 08, 1939)).
born("Павел Дмитриевич Шуст", date(21, 06, 1939)).
born("Елизавета Карловна Шуст", date(11, 05, 1913)).
born("Дмитрий Константинович Шуст", date(18, 02, 1910)).
born("Даниил Карлович Куранов", date(19, 04, 1908)).
born("Дарья Владимировна Куранова", date(11, 05, 1912)).
born("Карл Куранов", date(19, 07, 1885)).
born("Валентина Сергеевна Куранова", date(20, 12, 1889)).

% Parent relationships
parent("Татьяна Петровна Шуст", "Марья Владимировна Шуст").
parent("Татьяна Петровна Шуст", "Иван Владимирович Шуст").
parent("Владимир Павлович Шуст", "Марья Владимировна Шуст").
parent("Владимир Павлович Шуст", "Иван Владимирович Шуст").

parent("Елена Петровна Исмаилова", "Эльчин Дмитриевич Исмаилов").
parent("Дмитрий Дмитриевич Исмаилов", "Эльчин Дмитриевич Исмаилов").

parent("Михаил Григорьевич Адамов", "Николай Михаилович Адамов").
parent("Михаил Григорьевич Адамов", "Алена Михайловна Адамова").
parent("Михаил Григорьевич Адамов", "Петр Михаилович Адамов").
parent("Варвара Игнатова Адамова", "Николай Михаилович Адамов").
parent("Варвара Игнатова Адамова", "Алена Михайловна Адамова").
parent("Варвара Игнатова Адамова", "Петр Михаилович Адамов").

parent("Антонина Павловна Адамова", "Татьяна Петровна Шуст").
parent("Антонина Павловна Адамова", "Елена Петровна Исмаилова").
parent("Петр Михаилович Адамов", "Татьяна Петровна Шуст").
parent("Петр Михаилович Адамов", "Елена Петровна Исмаилова").

parent("Игорь Александрович Федоров", "Сергей Игоревич Федоров").
parent("Игорь Александрович Федоров", "Анна Игоревна Федорова").
parent("Игорь Александрович Федоров", "Кирилл Игоревич Федоров").
parent("Алла Павловна Федорова", "Сергей Игоревич Федоров").
parent("Алла Павловна Федорова", "Анна Игоревна Федорова").
parent("Алла Павловна Федорова", "Кирилл Игоревич Федоров").

parent("Павел Дмитриевич Шуст", "Владимир Павлович Шуст").
parent("Павел Дмитриевич Шуст", "Алла Павловна Федорова").
parent("Евгения Евдокимовна Шуст", "Владимир Павлович Шуст").
parent("Евгения Евдокимовна Шуст", "Алла Павловна Федорова").

parent("Елизавета Карловна Шуст", "Павел Дмитриевич Шуст").
parent("Дмитрий Константинович Шуст", "Павел Дмитриевич Шуст").

parent("Карл Куранов", "Елизавета Карловна Шуст").
parent("Карл Куранов", "Даниил Карлович Куранов").
parent("Валентина Сергеевна Куранова", "Елизавета Карловна Шуст").
parent("Валентина Сергеевна Куранова", "Даниил Карлович Куранов").

parent("Даниил Карлович Куранов", "Леонид Даниилович Куранов").
parent("Даниил Карлович Куранов", "Екатерина Данииловна Куранова").
parent("Дарья Владимировна Куранова", "Леонид Даниилович Куранов").
parent("Дарья Владимировна Куранова", "Екатерина Данииловна Куранова").

%rules

% 1. Получение текущего возраста человека на основании года рождения

current_year(2025). 

age(Person, Age) :-
    born(Person, date(_, _, BirthYear)),
    (   dead(Person, date(_, _, DeathYear)) 
    ->  Age is DeathYear - BirthYear
    ;   current_year(CurrentYear),
        Age is CurrentYear - BirthYear
    ).

% 2.  Правило для определения, что человек является не единственным ребенком
not_only_child(Person) :-
    parent(Parent, Person), (parent(Parent, Sibling), Sibling \= Person).

% 3. Сиблинги
siblings(X, Y) :-
       	parent(Z, X), %Z is a parent of X%
       	parent(Z, Y), % Z is a parent of Y
	Y \= X.     % it's not the same person
 
% 4. Человек является бабушкой или дедушкой (Grandparent) по отношению к другому.
grandparent(X, Y) :- 
	parent(X, Z), % X is a parent of Z
	parent(Z, Y).  % when Z is a parent of Y

% 5. Супруги
spouse(X, Y) :- spouse(Y, X, _).

% 6. Человек является взрослым (Adult), если его возраст >= 18 лет.
adult(Person) :-
    age(Person, Age),
    Age >= 18.

% Извлечение года из строки даты (формат DD.MM.YYYY)
extract_year(Date, Year) :-
    sub_string(Date, 6, 4, _, YearString),
    number_string(Year, YearString).

% Получение года события (смерти, свадьбы)
event_year(EventDate, Year) :-
    extract_year(EventDate, Year).

% 7. Проверка, был ли человек жив в указанный год
alive_in_year(Person, Year) :-
    born(Person, date(_, _, BirthYear)),
    (dead(Person, date(_, _, DeathYear)) -> 
        Year >= BirthYear, Year =< DeathYear
    ; 
        Year >= BirthYear
    ).

% 8. Правило: Человек является сиротой (Orphan) в определенный год, если оба родителя умерли до этого года.
orphan_in_year(Person, Year) :-
    parent(Parent1, Person),
    parent(Parent2, Person),
    Parent1 \= Parent2, % Учитываем двух разных родителей
    dead(Parent1, date(_, _, Year1)), Year1 < Year,
    dead(Parent2, date(_, _, Year2)), Year2 < Year.

% 9. Правило: Родитель-одиночка (Single Parent) в определенный году.
single_parent_in_year(Parent, Year) :-
    parent(Parent, Child),
    parent(Parent2, Child),
    Parent \= Parent2,
    alive_in_year(Child, Year),
    alive_in_year(Parent, Year), dead(Parent2, date(_, _, Year2)), Year2 < Year.

% 10. Правило: Человек является дядей или тетей (Aunt/Uncle) по отношению к другому.
aunt_or_uncle(AuntUncle, Person) :-
    parent(Parent, Person),
    siblings(AuntUncle, Parent).

% 11. Правило: Человек является прародителем (Ancestor) по отношению к другому.
ancestor(Ancestor, Descendant) :-
    parent(Ancestor, Descendant).
ancestor(Ancestor, Descendant) :-
    parent(Ancestor, Intermediate),
    ancestor(Intermediate, Descendant).

% 12. Правило: Человек является потомком (Descendant) по отношению к другому.
descendant(Descendant, Ancestor) :-
    ancestor(Ancestor, Descendant).

% 13. Правило: Двое людей являются двоюродными братьями или сестрами (Cousins).
cousins(Person1, Person2) :-
    parent(Parent1, Person1),
    parent(Parent2, Person2),
    sibling(Parent1, Parent2).

% 14. Правило: Человек является зятем (Son-in-law) или невесткой (Daughter-in-law).
% Зять: муж дочери.
son_in_law(SonInLaw, ParentInLaw) :-
    female(Child),
    parent(ParentInLaw, Child),
    spouse(Child, SonInLaw, _).

daughter_in_law(DaughterInLaw, ParentInLaw) :-
    male(Child),
    parent(ParentInLaw, Child),
    spouse(DaughterInLaw, Child, _).

 % 15. Правило: Человек является тестем или свекровью (Parent-in-law).
parent_in_law(ParentInLaw, ChildInLaw) :-
    son_in_law(ChildInLaw, ParentInLaw).
parent_in_law(ParentInLaw, ChildInLaw) :-
    daughter_in_law(ChildInLaw, ParentInLaw).

% 16. Правило: Определение поколения (Generation) человека относительно исходного.
% Человек из самого старого известного поколения (0).
generation(Person, 0) :-
    born(Person, _),
    not(parent(_, Person)). % У него нет известных родителей

% Поколение потомка на 1 больше поколения родителя.
generation(Person, N) :-
    parent(Parent, Person),
    generation(Parent, M),
    N is M + 1.

% 17. Правило: Семейная пара является бездетной (Childless Couple) в определенный год.
childless_couple_in_year(Wife, Husband, Year) :-
    spouse(Wife, Husband, date(_, _, Y)), Y < Year,
    not(parent(Wife, Child)), 
    not(parent(Husband, Child));
    parent(Wife, Child),
    parent(Husband, Child),
    not(alive_in_year(Child, Year))
    .

  % 18. Правило: Определение пола (Female) на основе окончания отчества или фактов.
female(Person) :-
    (   bachelorette(Person)
    ;   married(Person),
        (   sub_string(Person, _, _, _, "вна")
        ;   sub_string(Person, _, _, _, "ла")
        ;   sub_string(Person, _, _, _, "та")
        )
    ).
	
% 19. Правило: Определение пола (Male) на основе окончания отчества или фактов.
male(Person) :-
    (   bachelor(Person)
    ;   married(Person),
        (   sub_string(Person, _, _, _, "вич")
        ;   sub_string(Person, _, _, _, "лыч")
        ;   sub_string(Person, _, _, _, "рич")
        ;   sub_string(Person, _, _, _, "ерг")
        )
    ).

% 20. Правило для вычисления возраста человека на момент смерти
age_at_death(Person, Age) :-
    dead(Person, date(_, _, DeathYear)),
    born(Person, date(_, _, BirthYear)),
    Age is DeathYear - BirthYear.

% 21. Правило для вычисления длительности брака на момент смерти супруга или на текущий год
marriage_duration(Person1, Person2, Duration) :-
    spouse(Person1, Person2, date(_, _, WeddingYear)),
    (   dead(Person1, date(_, _, DeathYear1)),
        dead(Person2, date(_, _, DeathYear2))
    ->  % Оба умерли - берем меньший год смерти
        min(DeathYear1, DeathYear2, EndYear)
    ;   dead(Person1, date(_, _, DeathYear1))
    ->  % Только Person1 умер
        EndYear = DeathYear1
    ;   dead(Person2, date(_, _, DeathYear2))
    ->  % Только Person2 умер
        EndYear = DeathYear2
    ;   % Оба живы - используем текущий год
        get_time(TimeStamp),
        stamp_date_time(TimeStamp, DateTime, local),
        date_time_value(year, DateTime, EndYear)
    ),
    Duration is EndYear - WeddingYear.

% Вспомогательный предикат для нахождения минимального значения
min(A, B, A) :- A =< B, !.
min(A, B, B) :- B < A.

% 22. Правило для проверки, является ли человек вдовцом/вдовой
widowed(Person) :-
    married(Person),
    spouse(Person, Spouse, _),
    dead(Spouse, _),
    dead(Person, _) = false.

% 23. Правило для родителей, переживших своего ребенка (выводется возраст на который родитель пережил ребенка)
outlived_own_child(Parent, Gap) :-
    parent(Parent, Child),
    dead(Child, date(_, _, ChildDeathYear)),
    dead(Parent, date(_, _, ParentDeathYear)),
    ParentDeathYear > ChildDeathYear,
    Gap is ParentDeathYear - ChildDeathYear.

% 24. Правило для определения молодоженов (брак длится менее 5 лет)
newlyweds(Husband, Wife) :-
    spouse(Husband, Wife, date(_, _, WeddingYear)),
    YearsMarried is 2025 - WeddingYear,
    YearsMarried < 5.

% 25. Правило для определения, что брак был заключен до рождения ребенка
married_before_child(Husband, Wife) :-
    spouse(Husband, Wife, date(_, _, WeddingYear)),
    parent(Husband, Child),
    parent(Wife, Child),
    born(Child, date(_, _, ChildBirthYear)),
    WeddingYear < ChildBirthYear.

% 26. Правило для человека, который никогда не был в браке и старше 30 лет
lifelong_bachelor(Person) :-
    bachelor(Person);
	bachelorette(Person),
    age(Person, Age),
    Age > 30.

% 27. Правило для определения, что ребенок родился у молодых родителей (родителям было меньше 20 лет)
born_to_young_parents(Person) :-
    parent(Parent, Person),
    born(Parent, date(_, _, ParentBirthYear)),
    born(Person, date(_, _, PersonBirthYear)),
    ParentAge is PersonBirthYear - ParentBirthYear,
    ParentAge < 20.

% 29. Правило для определения разницы в возрасте между супругами 
age_gap_marriage(Husband, Wife, Diff) :-
    spouse(Husband, Wife, _),
    age(Husband, AgeH),
    age(Wife, AgeW),
    Diff is abs(AgeH - AgeW).

% 30. Правило для определения, что человек является старшим ребенком (родился раньше всех своих братьев и сестер)
eldest_child(Person) :-
    parent(Parent, Person),
    born(Person, date(_, _, PersonBirthYear)),
    (parent(Parent, Sibling), born(Sibling, date(_, _, SiblingBirthYear)), Sibling \= Person, ! , SiblingBirthYear > PersonBirthYear) .
```


## Онтология в Protege

![image.png](assets/image_6.png)

![image.png](assets/image_7.png)


# Лабораторная работа №2

## Изучение основных концепций и инструментов

На базе `Первой Лабораторной Работы` мне нужно было разработать программу (рекомендательную систему), которая бы
взаимодействовала со сделанной базой знаний. Выбор пал на `Python` , как на язык разработки, так как в нем имеются
неплохие библиотеки для работы с базами знания `Prolog.` Я долго выбирала между `SwiProlog` и `Pyswip`  (библиотеки,
предоставляющие инструментарий для работы с  `Prolog` и `Python` ), но по итогу выбрала `SwiProlog`, так как
документация у него была приятнее

## Ход работы



### Код программы

### Полный код можно посмотреть тут - https://github.com/MaryShust/ai/blob/main/laba2/laba2.py

# Примеры выполнения программ

## Лабораторная  работа №1


```prolog
?- list_all_friends.
abigail имеет следующих друзей: haley.
alex не имеет друзей.
caroline не имеет друзей.
clint не имеет друзей.
demetrius не имеет друзей.
elliott не имеет друзей.
emily не имеет друзей.
evelyn не имеет друзей.
george не имеет друзей.
gus не имеет друзей.
haley имеет следующих друзей: abigail.
jas не имеет друзей.
jodi не имеет друзей.
kent не имеет друзей.
leah не имеет друзей.
lewis не имеет друзей.
linus не имеет друзей.
maru не имеет друзей.
marnie не имеет друзей.
pam не имеет друзей.
penny не имеет друзей.
pierre не имеет друзей.
robin не имеет друзей.
sam не имеет друзей.
sandy не имеет друзей.
sebastian не имеет друзей.
shane не имеет друзей.
vincent не имеет друзей.
true.
```

### `make_friends(haley, sam). -> list_friends(haley).`

```prolog
?- make_friends(haley, sam).
haley и sam теперь друзья!
true.

?- list_friends(haley).
haley имеет следующих друзей: abigail, sam.
true.
```

### `step-siblings(X,Y).`

```prolog
?- step-siblings(X,Y).
X = sebastian,
Y = maru ;
false.
```

### `spouse(jodi,X). -> spouse(kent, X). - check symmetry rule`

```prolog
?- spouse(jodi, X).
X = kent.

?- spouse(kent, X).
X = jodi ;
```

### `Ruin Haley & Sam friendship`

```prolog
?- make_friends(haley,sam).
haley и sam теперь друзья!
true.

?- check_friendship(haley,sam).
haley и sam друзья! Уровень дружбы: 0
true.

?- gave_gift(sam,haley,pufferfish).
sam и haley друзья! Уровень дружбы: -4
true.

?- gave_gift(sam,haley,pufferfish).
sam и haley больше не друзья!
true.

?- check_friendship(haley,sam).
haley и sam не друзья!
true.
```

## Лабораторная работа №2

### `initialization -> help command`

![image.png](assets/image_9.png)

### `list all residents`

![image.png](assets/image_10.png)

### `list gifts`

![image.png](assets/image_11.png)

### `list all friends`

![image.png](assets/image_12.png)

### `friends of <resident>`

![image.png](assets/image_13.png)

### `make friends <resident> <resident>`

![image.png](assets/image_14.png)

### `residents by <age> | <gender> | <name> <argument>`

![image.png](assets/image_15.png)

### `spouse of <resident>`

![image.png](assets/image_16.png)

### `all spouses`

![image.png](assets/image_17.png)

### `children of <resident>`

![image.png](assets/image_18.png)

### `parents of <resident>`

![image.png](assets/image_19.png)

### `siblings of <resident>`

![image.png](assets/image_20.png)

### `gave gift from <resident> to <resident>`

- **ruin friendship**

  ![image.png](assets/image_21.png)

- **level up friendship**

  ![image.png](assets/image_22.png)

- **command exceptions validation**

  ![image.png](assets/image_23.png)

### `exit`

![image.png](assets/image_24.png)

# Заключение

До выполнения лабораторных работ данного модуля я в целом не знала о существовании `Prolog` и `Protege` .

Первая лабораторная работа была не самой интересной, но тематика базы знаний скрасила написание правил и фактов, а
главное их придумывание.

Вторая лабораторная работа была интересной, да и полезной, в принципе. Я узнала про `SWI-Prolog` библиотеку для `Python`
и написала смешное консольно приложение в свое удовольствие

До начала выполнения лабораторных работ в рамках этого модуля я не знала о существовании  `Prolog` и `Protege`. Это были
для меня новые концепции, но при этом чтение о них в [методическом пособии](https://books.ifmo.ru/file/pdf/3308.pdf)
было довольно увлекательным и не отягощало. В общем, было познавательно, хоть и не особо актуально

Первая лабораторная работа, посвященная созданию базы знаний, не оказалась особенно увлекательной, но писать базу знаний
на основе Stardew Valley было забавно, поэтому не так скучно. Создание онтологии в `Protege` было самой неприятно частью
работы, так как приходилось интуитивно разбираться в не самом удобном и новом интерфейсе, потому что какую-то
документацию и пояснения я найти не смоггла

Во второй лабораторной работе я столкнулась с `SWI-Prolog` — библиотекой для работы с `Prolog` в Python, и эта задача
оказалась более интересной и полезной. Я узнала о возможности интеграции `Prolog` с Python. Написала смешное консольно
приложение в свое удовольствие, большего мне и не надо, в принципе.

В целом, второй опыт с `Prolog` и Python был положительным, так как я смогла увидеть, как эти технологии могут
взаимодействовать и быть полезными в каких-нибудь (не думаю что очень реальных) проектах.
