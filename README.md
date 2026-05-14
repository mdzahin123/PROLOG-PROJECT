# Random Food Order Generator (Prolog)

A small Prolog program that generates random food orders by picking one item at random from each of four category lists: **sandwich**, **side**, **beverage**, and **dessert**.

Originally written for **CMPSC 460 — Principles of Programming Languages** (Penn State Harrisburg, Spring 2026) as a simplified Prolog port of an earlier Lisp food-order generator.

## How it works

The program defines four category predicates, each returning the list of food items for that category:

| Category   | Items                                                  |
| ---------- | ------------------------------------------------------ |
| Sandwiches | `blt`, `tunaSalad`, `grilledCheese`, `hamburger`, `hotdog` |
| Sides      | `tossedSalad`, `pastaSalad`, `fries`, `onionRings`, `chips` |
| Beverages  | `lemonade`, `icedTea`, `water`, `soda`, `coffee`        |
| Desserts   | `iceCream`, `cake`, `pie`, `brownie`, `cookies`         |

The order is built by `make_food_order/1`, which picks a random item from each list (in the required order) using:

- `pick_random/2` — picks an item at a uniformly random index using SWI-Prolog's `random_float`.
- `nth_element/3` — a recursive predicate that retrieves an element by index. It has a **base clause** (index 0 returns the head) and a **recursive clause** (decrement index, recurse on the tail).

No food items are stored as individual facts, and no object-oriented Prolog features are used — per the assignment spec.

## Requirements

- [SWI-Prolog](https://www.swi-prolog.org/) (developed with version 10.0.2-1, but any recent version works)

## How to run

### 1. Install SWI-Prolog

- **Windows:** download the installer from [swi-prolog.org/download/stable](https://www.swi-prolog.org/download/stable) and run it.
- **macOS:** `brew install swi-prolog`
- **Linux (Debian/Ubuntu):** `sudo apt install swi-prolog`

Verify the install with:

```bash
swipl --version
```

### 2. Clone this repo

```bash
git clone https://github.com/<your-username>/<your-repo>.git
cd <your-repo>
```

### 3. Start SWI-Prolog and load the program

From the project folder, run:

```bash
swipl Randomfoodgenerator.pl
```

Or, if you opened SWI-Prolog without arguments, consult the file from inside the interpreter:

```prolog
?- [Randomfoodgenerator].
```

> On Windows you can also just double-click `Randomfoodgenerator.pl` to open it in SWI-Prolog.

### 4. Generate a food order

At the `?-` prompt, run:

```prolog
?- make_food_order([Sandwich, Side, Beverage, Dessert]).
```

Press **Enter** (or `.` then Enter) to accept the result. Repeat the query to generate a new random order. Type `halt.` to exit SWI-Prolog.

### Example output

```
?- make_food_order([Sandwich, Side, Beverage, Dessert]).
Sandwich = tunaSalad,
Side = pastaSalad,
Beverage = coffee,
Dessert = iceCream .

?- make_food_order([Sandwich, Side, Beverage, Dessert]).
Sandwich = hamburger,
Side = pastaSalad,
Beverage = soda,
Dessert = cake .

?- make_food_order([Sandwich, Side, Beverage, Dessert]).
Sandwich = hotdog,
Side = fries,
Beverage = water,
Dessert = brownie .
```

Each call produces a fresh random order.

## Files

- `Randomfoodgenerator.pl` — Prolog source code
- `SAMPLE QUERIES.docx` — sample output from running the program in SWI-Prolog

## Author

Muhammad Danish Zahin Bin Rafizal — `mjr7066@psu.edu`

## Notes

GitHub Copilot was used during development; see the header comment in `Randomfoodgenerator.pl`.
