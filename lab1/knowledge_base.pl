% ==================== БАЗА ЗНАНИЙ: ГАЧА-ИГРЫ ====================

% Факты с одним аргументом (объекты и их свойства)
% --------------------------------------------------

% Игры
game('Genshin Impact').
game('Honkai: Star Rail').
game('Fate/Grand Order').
game('Arknights').
game('Blue Archive').
game('Azur Lane').
game('Nikke: Goddess of Victory').
game('Tower of Fantasy').
game('Epic Seven').
game('Fire Emblem Heroes').
game('Uma Musume').
game('Princess Connect').
game('Punishing: Gray Raven').
game('Granblue Fantasy').
game('Counter:Side').
game('Path to Nowhere').
game('Reverse: 1999').
game('Snowbreak').
game('Aether Gazer').
game('Neural Cloud').

% Разработчики
developer('HoYoverse').
developer('miHoYo').
developer('TYPE-MOON').
developer('Hypergryph').
developer('Yostar').
developer('Shift Up').
developer('Perfect World').
developer('Smilegate').
developer('Nintendo').
developer('Cygames').

% Жанры
genre('Action RPG').
genre('Turn-based RPG').
genre('Tactical RPG').
genre('Gacha RPG').
genre('Shooter').
genre('Simulation').
genre('Strategy').
genre('Card Game').

% Пол персонажей
gender('Male').
gender('Female').

% Редкость персонажей
rarity('3-star').
rarity('4-star').
rarity('5-star').
rarity('6-star').
rarity('SSR').
rarity('UR').

% Факты с двумя аргументами (отношения между объектами)
% ------------------------------------------------------

% Игра - Разработчик
developed_by('Genshin Impact', 'HoYoverse').
developed_by('Honkai: Star Rail', 'HoYoverse').
developed_by('Fate/Grand Order', 'TYPE-MOON').
developed_by('Arknights', 'Hypergryph').
developed_by('Blue Archive', 'Yostar').
developed_by('Azur Lane', 'Yostar').
developed_by('Nikke: Goddess of Victory', 'Shift Up').
developed_by('Tower of Fantasy', 'Perfect World').
developed_by('Epic Seven', 'Smilegate').
developed_by('Fire Emblem Heroes', 'Nintendo').
developed_by('Uma Musume', 'Cygames').
developed_by('Princess Connect', 'Cygames').

% Игра - Жанр
game_genre('Genshin Impact', 'Action RPG').
game_genre('Honkai: Star Rail', 'Turn-based RPG').
game_genre('Fate/Grand Order', 'Turn-based RPG').
game_genre('Arknights', 'Tactical RPG').
game_genre('Blue Archive', 'Strategy').
game_genre('Azur Lane', 'Strategy').
game_genre('Nikke: Goddess of Victory', 'Shooter').
game_genre('Tower of Fantasy', 'Action RPG').
game_genre('Epic Seven', 'Turn-based RPG').
game_genre('Fire Emblem Heroes', 'Tactical RPG').

% Персонаж - Игра
character_in('Raiden Shogun', 'Genshin Impact').
character_in('Kafka', 'Honkai: Star Rail').
character_in('Artoria', 'Fate/Grand Order').
character_in('Amiya', 'Arknights').
character_in('Hoshino', 'Blue Archive').
character_in('Enterprise', 'Azur Lane').
character_in('Red Hood', 'Nikke: Goddess of Victory').
character_in('Nemesis', 'Tower of Fantasy').
character_in('Vildred', 'Epic Seven').
character_in('Ike', 'Fire Emblem Heroes').

% Персонаж - Пол
character_gender('Raiden Shogun', 'Female').
character_gender('Kafka', 'Female').
character_gender('Artoria', 'Female').
character_gender('Amiya', 'Female').
character_gender('Hoshino', 'Female').
character_gender('Enterprise', 'Female').
character_gender('Red Hood', 'Female').
character_gender('Nemesis', 'Female').
character_gender('Vildred', 'Male').
character_gender('Ike', 'Male').

% Персонаж - Редкость
character_rarity('Raiden Shogun', '5-star').
character_rarity('Kafka', '5-star').
character_rarity('Artoria', '5-star').
character_rarity('Amiya', '5-star').
character_rarity('Hoshino', '3-star').
character_rarity('Enterprise', 'SSR').
character_rarity('Red Hood', 'SSR').
character_rarity('Nemesis', 'SSR').
character_rarity('Vildred', '5-star').
character_rarity('Ike', '5-star').

% Персонаж - Оружие
character_weapon('Raiden Shogun', 'Polearm').
character_weapon('Kafka', 'Lightning').
character_weapon('Artoria', 'Excalibur').
character_weapon('Amiya', 'Sword').
character_weapon('Hoshino', 'Shotgun').
character_weapon('Enterprise', 'Aircraft').
character_weapon('Red Hood', 'Rifle').
character_weapon('Nemesis', 'Dual Pistols').
character_weapon('Vildred', 'Sword').
character_weapon('Ike', 'Sword').

% Шанс выпадения персонажа
drop_chance('Raiden Shogun', 0.6).
drop_chance('Kafka', 0.6).
drop_chance('Artoria', 0.8).
drop_chance('Amiya', 1.2).
drop_chance('Hoshino', 2.5).
drop_chance('Enterprise', 1.2).
drop_chance('Red Hood', 0.5).
drop_chance('Nemesis', 0.75).
drop_chance('Vildred', 1.0).
drop_chance('Ike', 0.8).

% ПРАВИЛА (логические выводы)
% --------------------------------------------------

% Правило 1: Персонаж является редким, если его редкость 5-star или SSR
rare_character(Character) :-
    character_rarity(Character, Rarity),
    (Rarity = '5-star'; Rarity = 'SSR').

% Правило 2. Список всех видеоигр.
list_of_video_games(Games) :- 
   findall(Game, game(Game), Games).

% Правило 3: Персонажа тяжело получить если он женского пола с низким шансом выпадения
waifu_hard_to_get(Character) :-
    character_gender(Character, 'Female'),
    drop_chance(Character, Chance),
    Chance < 0.7.

% Правило 4: Игра определенного жанра от определенного разработчика
developer_genre(Developer, Genre) :-
    developed_by(Game, Developer),
    game_genre(Game, Genre).

% Правило 5: Персонажи, которые используют меч
sword_user(Character) :-
    character_weapon(Character, Weapon),
    (Weapon = 'Sword'; Weapon = 'Excalibur').

