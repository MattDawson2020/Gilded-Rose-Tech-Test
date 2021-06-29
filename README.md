# Gilded rose tech test

## My Plan

- My first step was to read the challenge specifications carefully and examine the legacy code left for me to understand exactly what the steps to completion were
- I quickly realized that trying to fix the original method was going to be substantially harder than simply rewriting it bit by bit, which would also allow me to TDD
- I wrote a template if statement to be placed inside the iterator method to determine logic based on item name, each branch would have its own helper methods
- I first wrote the logic for the aged brie because it was unique in not degrading, and wrote minimal code to pass this
- I then added sell_in logic and maximum quality logic, then refactoring maximum quality to be usable by any other branch
- I followed this strategy item by item, writing tests for the full item requirements, passing it with bulky code, then extracting this code to helper methods for better SRP
- This eventually lead to all basic logic passing, from here it was just a matter of refactoring the code to make sure operations were as efficient and DRY as possible
- By the end the only other task was to comb through my tests and make sure there was proper coverage, and use RSpec syntax to reduce the repetition as much as possible
- The end result is my code is both much easier to read than the old code, but the SRP helper methods and tests make it extremely easy to change
- For final thoughts I think my main iteration method is larger than I would like, but cannot think of a simple/ cleaner way to do it than what I have now

## Feedback and changes

<details>
  <summary> What the coach liked </summary>
  
  * Code is clean and easily readable compared to before
  
  * Tests are thorough and coverage is good
  
  * Everything works exactly as expected 
  
</details>

<details>
  <summary> Improvements to be made </summary>
  
  * Coach pointed out there is no reason each item cannot be a class by itself, by using inheritance we can replicate functionality and change when needed
 
  * Gilded rose class is doing too many things, it should only be responsible for holding and iterating on items, rather than handling update logic
  
</details>


## Running the code
Simply clone this repo to get a copy of the code, you can then use RSpec gem with keyword <rspec> in the command line to run the tests.
Alternatively you can use a REPL like irb or pry to run the code.


## Kata details

This is a well known kata developed by Terry Hughes. This is commonly used as a tech test to assess a candidate's ability to read, refactor and extend legacy code.

Here is the text of the kata:

\*"Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:

All items have a SellIn value which denotes the number of days we have to sell the item. All items have a Quality value which denotes how valuable the item is. At the end of each day our system lowers both values for every item. Pretty simple, right? Well this is where it gets interesting:

Once the sell by date has passed, Quality degrades twice as fast
The Quality of an item is never negative
“Aged Brie” actually increases in Quality the older it gets
The Quality of an item is never more than 50
“Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
“Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert
We have recently signed a supplier of conjured items. This requires an update to our system:

“Conjured” items degrade in Quality twice as fast as normal items
Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we’ll cover for you)."\*

