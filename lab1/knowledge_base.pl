/*
База знаний о видеоиграх, включающая информацию о жанрах, платформах, студиях разработчиках,
игровых персонажах и их характеристиках.
*/

/* ФАКТЫ С ОДНИМ АРГУМЕНТОМ (более 20) */

% Жанры игр
genre(rpg).
genre(action).
genre(adventure).
genre(strategy).
genre(simulation).
genre(sports).
genre(horror).
genre(fighting).
genre(puzzle).
genre(mmo).
genre(platformer).
genre(racing).
genre(shooter).
genre(sandbox).
genre(survival).

% Платформы
platform(pc).
platform(playstation).
platform(xbox).
platform(nintendo_switch).
platform(mobile).

% Студии разработчики
developer(cd_projekt_red).
developer(naughty_dog).
developer(rockstar).
developer(nintendo).
developer(fromsoftware).
developer(valve).
developer(ubisoft).

/* ФАКТЫ С ДВУМЯ АРГУМЕНТАМИ (10-15) */

% Игра и ее жанр
game_genre(the_witcher_3, rpg).
game_genre(cyberpunk_2077, rpg).
game_genre(the_last_of_us, action).
game_genre(the_last_of_us, adventure).
game_genre(grand_theft_auto_v, action).
game_genre(grand_theft_auto_v, sandbox).
game_genre(red_dead_redemption_2, action).
game_genre(red_dead_redemption_2, adventure).
game_genre(dark_souls_3, rpg).
game_genre(dark_souls_3, action).
game_genre(portal_2, puzzle).
game_genre(portal_2, adventure).
game_genre(assassins_creed_valhalla, action).
game_genre(assassins_creed_valhalla, rpg).
game_genre(minecraft, sandbox).
game_genre(minecraft, survival).

% Игра и платформа
game_platform(the_witcher_3, pc).
game_platform(the_witcher_3, playstation).
game_platform(the_witcher_3, xbox).
game_platform(cyberpunk_2077, pc).
game_platform(cyberpunk_2077, playstation).
game_platform(cyberpunk_2077, xbox).
game_platform(the_last_of_us, playstation).
game_platform(grand_theft_auto_v, pc).
game_platform(grand_theft_auto_v, playstation).
game_platform(grand_theft_auto_v, xbox).
game_platform(dark_souls_3, pc).
game_platform(dark_souls_3, playstation).
game_platform(dark_souls_3, xbox).
game_platform(minecraft, pc).
game_platform(minecraft, mobile).

% Игра и разработчик
game_developer(the_witcher_3, cd_projekt_red).
game_developer(cyberpunk_2077, cd_projekt_red).
game_developer(the_last_of_us, naughty_dog).
game_developer(grand_theft_auto_v, rockstar).
game_developer(red_dead_redemption_2, rockstar).
game_developer(dark_souls_3, fromsoftware).
game_developer(portal_2, valve).
game_developer(minecraft, mojang).

% Персонажи и их игры
character_in_game(geralt, the_witcher_3).
character_in_game(vesemir, the_witcher_3).
character_in_game(v, cyberpunk_2077).
character_in_game(johnny_silverhand, cyberpunk_2077).
character_in_game(joel, the_last_of_us).
character_in_game(ellie, the_last_of_us).
character_in_game(arthur_morgan, red_dead_redemption_2).
character_in_game(john_marston, red_dead_redemption_2).
character_in_game(chell, portal_2).
character_in_game(steve, minecraft).

% Характеристики персонажей
character_gender(geralt, male).
character_gender(vesemir, male).
character_gender(v, non_binary). % V может быть любого пола
character_gender(johnny_silverhand, male).
character_gender(joel, male).
character_gender(ellie, female).
character_gender(arthur_morgan, male).
character_gender(john_marston, male).
character_gender(chell, female).
character_gender(steve, male).

/* ПРАВИЛА (5-7) */

% Правило 1: Игра является мультиплатформенной, если она доступна более чем на 2 платформах
multiplatform(Game) :-
    game_platform(Game, Platform1),
    game_platform(Game, Platform2),
    game_platform(Game, Platform3),
    Platform1 = Platform2,
    Platform2 = Platform3,
    Platform1 = Platform3.

% Правило 2: Персонаж является главным, если его имя совпадает с названием игры (упрощенное правило)
main_character(Character, Game) :-
    character_in_game(Character, Game),
    atom_chars(Game, GameChars),
    atom_chars(Character, CharChars),
    sublist(CharChars, GameChars). % Упрощенная проверка на вхождение имени в название

% Вспомогательное правило для проверки подсписка
sublist([], _).
sublist([X|Xs], [X|Ys]) :- sublist(Xs, Ys).
sublist([X|Xs], [_|Ys]) :- sublist([X|Xs], Ys).

% Правило 3: Игра является эксклюзивом платформы, если доступна только на одной платформе
platform_exclusive(Game, Platform) :-
    game_platform(Game, Platform),
    + (game_platform(Game, OtherPlatform), OtherPlatform = Platform).

% Правило 4: Игра относится к action-rpg, если она одновременно action и rpg
action_rpg(Game) :-
    game_genre(Game, action),
    game_genre(Game, rpg).

% Правило 5: Персонажи из одной игры
same_game_characters(Char1, Char2) :-
    character_in_game(Char1, Game),
    character_in_game(Char2, Game),
    Char1 = Char2.

% Правило 6: Разработчик специализируется на жанре, если у него более одной игры в этом жанре
developer_specialization(Developer, Genre) :-
    game_developer(Game1, Developer),
    game_developer(Game2, Developer),
    Game1 = Game2,
    game_genre(Game1, Genre),
    game_genre(Game2, Genre).
