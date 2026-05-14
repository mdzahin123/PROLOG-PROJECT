% Author:      Muhammad Danish Zahin Bin Rafizal
% E-mail:      mjr7066@psu.edu
% Course:      CMPSC 460
% Assignment:  Prolog Programming Project
% Due date:    5/5/2026
% File:        Randomfoodgenerator.pl
% Purpose:     This program uses random-number generation to create food
%              orders from lists of different categories of food items.
%              A random sandwich, side, beverage, and dessert are chosen
%              in that order from four category lists to build an order.
% IDE/Compiler:
%              SWI-Prolog (version 10.0.2-1)
% Operating system:
%              MS Windows 11
% References:  Web sites listed our course Programming Language Resources
%              page
%              https://www.swi-prolog.org/pldoc/man?function=random/1
% AI Tool(s):  GitHub Copilot


% ---------------------------------------------------------------------------
% Category predicates -- each one returns the list of food items for its
% category.
% ---------------------------------------------------------------------------

sandwiches([blt, tunaSalad, grilledCheese, hamburger, hotdog]).

sides([tossedSalad, pastaSalad, fries, onionRings, chips]).

beverages([lemonade, icedTea, water, soda, coffee]).

desserts([iceCream, cake, pie, brownie, cookies]).


% ---------------------------------------------------------------------------
% nth_element(+Index, +List, -Element)
%
%   Base case:      index 0 returns the head of the list.
%   Recursive case: for index N > 0, recurse on the tail with index N - 1.
% ---------------------------------------------------------------------------

% Base clause
nth_element(0, [Head | _], Head).

% Recursive clause
nth_element(N, [_ | Tail], Element) :-
    N > 0,
    NextN is N - 1,
    nth_element(NextN, Tail, Element).


% ---------------------------------------------------------------------------
% pick_random(+List, -Item)
%
% Picks an item from List at a uniformly random position using SWI-Prolog
% built-in random/1 
% ---------------------------------------------------------------------------

pick_random(List, Item) :-
    length(List, Len),
    Index is truncate(random_float * Len),
    nth_element(Index, List, Item).


% ---------------------------------------------------------------------------
% make_food_order(-Order)
%
% Builds a random food order by selecting one item from each category list
% in the required order: sandwich, side, beverage, dessert.
% ---------------------------------------------------------------------------

make_food_order([Sandwich, Side, Beverage, Dessert]) :-
    sandwiches(SandwichList),
    pick_random(SandwichList, Sandwich),
    sides(SideList),
    pick_random(SideList, Side),
    beverages(BeverageList),
    pick_random(BeverageList, Beverage),
    desserts(DessertList),
    pick_random(DessertList, Dessert).