% Zadání č. 13: 
% Napište program řešící úkol daný predikátem u13(LIN), kde LIN je vstupní  
% číselný seznam s nejméně jedním prvkem. Predikát je pravdivý (má hodnotu true),  
% pokud je hodnota největšího prvku seznamu LIN větší než absolute_valueolutní hodnota  
% nejmenšího prvku seznamu LIN, jinak je predikát nepravdivý má hodnotu false.  
 
% Testovací predikáty: 
u13_1:- u13([22.15, 1, -23, 12, 6, -8, 2]).             % false 
u13_2:- u13([22, 1.8, -23, 42.5, 6, -8, 2]).            % true 
u13_3:- u13([7]).                                       % false 
u13_r:- write('Zadej LIN: '),read(LIN),u13(LIN). 
 
u13(LIN):- solution(LIN).

% If the list is empty, the result will be false.
solution([]).

% The head of the list is separated from the Tail of the list. The Tail is the original list with its first element removed.
solution([Head|Tail]):- minimum(Tail, Head, Min), maximum(Tail, Head, Max),
  (absolute_value(Min, M_min), absolute_value(Max, M_max), M_max > M_min).

% Find the minimum in the list.
minimum([], Min, Min).
minimum([Head|Tail], Num, Min):- (Head < Num -> minimum(Tail, Head, Min); minimum(Tail, Num, Min)).

% Find the maximum in the list.
maximum([], Max, Max).
maximum([Head|Tail], Num, Max):- ( Head > Num -> maximum(Tail, Head, Max); maximum(Tail, Num, Max)).

% Find absolute_value.
absolute_value(X, Y):- X < 0 -> Y is -X ; Y = X.