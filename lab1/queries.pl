% Проверка существования:
?- game('Genshin Impact').        % True
?- game('Cyberpunk 2077').        % False
?- developer(D).                  % Переберет всех разработчиков
?- genre(G).                      % Переберет все жанры

% Получение конкретных фактов:
?- developed_by('Arknights', Dev).        % Dev = 'Hypergryph'
?- game_genre('Honkai: Star Rail', Genre). % Genre = 'Turn-based RPG'
?- character_gender('Kafka', Gender).     % Gender = 'Female'

% Запросы с логическими операторами
% Оператор И (запятая):
?- game(G), developed_by(G, 'HoYoverse'). % Все игры от HoYoverse
?- character_in(C, 'Genshin Impact'), character_gender(C, 'Female'). % Все женские персонажи в Genshin

% Оператор ИЛИ (точка с запятой):
?- developed_by(G, 'HoYoverse'); developed_by(G, 'miHoYo'). % Игры от HoYoverse ИЛИ miHoYo
?- character_rarity(C, '5-star'); character_rarity(C, 'SSR'). % Персонажи 5-star ИЛИ SSR

% Комбинация И и ИЛИ:
?- character_in(C, Game), (Game = 'Genshin Impact'; Game = 'Honkai: Star Rail'). % Персонажи из GI или HSR

% Запросы с переменными
% Поиск всех соответствий:
?- character_in(Character, Game).          % Все пары персонаж-игра
?- developed_by(Game, Developer).          % Все пары игра-разработчик
?- character_weapon(Character, Weapon).    % Все персонажи с их оружием

% Поиск с конкретными условиями:
?- character_in(C, 'Arknights'), character_rarity(C, Rarity). % Все персонажи Arknights с их редкостью
?- game_genre(G, 'Turn-based RPG'), developed_by(G, Dev). % Все пошаговые RPG и их разработчики
