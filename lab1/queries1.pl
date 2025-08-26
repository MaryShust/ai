/* ЗАПРОСЫ */

% 1. Простые запросы для поиска фактов
% Какие игры доступны на PC?
% ?- game_platform(Game, pc).

% Какие игры разработала Naughty Dog?
% ?- game_developer(Game, naughty_dog).

% 2. Запросы с логическими операторами
% Какие игры являются эксклюзивами PlayStation?
% ?- platform_exclusive(Game, playstation).

% Какие игры являются action, но не являются rpg?
% ?- game_genre(Game, action), + game_genre(Game, rpg).

% 3. Запросы с переменными
% Какие персонажи женского пола?
% ?- character_gender(Character, female).

% Какие игры доступны и на PC, и на PlayStation?
% ?- game_platform(Game, pc), game_platform(Game, playstation).

% 4. Запросы, требующие выполнения правил
% Какие игры являются action-rpg?
% ?- action_rpg(Game).

% Какие студии специализируются на RPG?
% ?- developer_specialization(Developer, rpg).

% Какие персонажи из одной игры?
% ?- same_game_characters(Char1, Char2).
