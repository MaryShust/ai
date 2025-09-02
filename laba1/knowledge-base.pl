% Married characters
married("Владимир").
married("Татьяна").
married("Иван").
married("Арина").
married("Елена").
married("Дмитрий").
married("Антонина").
married("Петр").
married("Варвара").
married("Михаил").
married("Игорь").
married("Алла").
married("Евгения").
married("Павел").
married("Елизавета").
married("Дмитрий К.").
married("Даниил").
married("Дарья").
married("Карл").
married("Валентина").

% Bachelors
bachelor("Николай").
bachelor("Сергей").
bachelor("Кирил").
bachelor("Ильчин").
bachelor("Леонид").

% Bachelorettes
bachelorette("Алена").
bachelorette("Марья").
bachelorette("Екатерина").
bachelorette("Анна").

% Spouse relationships 
spouse("Варвара", "Михаил").
spouse("Антонина", "Петр").
spouse("Елена", "Дмитрий").
spouse("Татьяна", "Владимир").
spouse("Арина", "Иван").
spouse("Алла", "Игорь").
spouse("Евгения", "Павел").
spouse("Елизавета", "Дмитрий К.").
spouse("Валентина", "Карл").
spouse("Дарья", "Даниил").

% Spouse relationships (divorced)
divorced("Дарья","Захар").
divorced("Валентина","Ярослав").

% Parent relationships
parent("Татьяна", "Марья").
parent("Татьяна", "Иван").
parent("Елена", "Ильчин").
parent("Михаил", "Николай").
parent("Михаил", "Алена").
parent("Михаил", "Петр").
parent("Антонина", "Татьяна").
parent("Антонина", "Елена").
parent("Игорь", "Сергей").
parent("Игорь", "Анна").
parent("Игорь", "Кирил").
parent("Павел", "Алла").
parent("Елизавета", "Павел").
parent("Карл", "Елизавета").
parent("Карл", "Даниил").
parent("Даниил", "Екатерина").
parent("Даниил", "Леонид").

%rules

divorced(X) :- 
	married(X),       % X is in married list
      	\+ spouse(X, _).  % but have no couple in spouse list


siblings(X, Y) :-
       	parent(Z, X), %Z is a parent of X%
       	parent(Z, Y), % Z is a parent of Y
	Y \= X.     % it's not the same person

grandparent(X, Y) :- 
	parent(X, Z), % X is a parent of Z
	parent(Z, Y).  % when Z is a parent of Y

half_siblings(S1, S2):-
	parent(P1, S1),  %P1 is parent of the first child
	spouse(P1, P2),  %P1 is P2 husband or wife
       	parent(P2, S2),  %find the second sibling, whose parent is P2
	S1 \= S2,        % S1 and S2 cannot be one person
       	P1 \= P2, 	 % parents also couldn't be one person
	not(parent(P2,S1)).  %the second parent can't be bio-parent of the first child )

spouse(X, Y) :- spouse(Y, X).
