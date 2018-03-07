# Gilded Rose Kata - Swift

This is a Swift version of the Gilded Rose Kata code challenge, turned into an interface-based app.
This Kata was originally created by [Terry Hughes](http://twitter.com/#!/TerryHughes). It is already on GitHub [here](https://github.com/NotMyself/GildedRose). See also [Bobby Johnson's description of the kata](http://iamnotmyself.com/2011/02/13/refactor-this-the-gilded-rose-kata/).

So, without further ado:

Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:

- All items have a SellIn value which denotes the number of days we have left to sell the item
- All items have a Quality value which denotes how valuable the item is
- At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

- Once the sell by date has passed, Quality degrades twice as fast
- The Quality of an item is never negative
- "Aged Brie" actually increases in Quality the older it gets
- The Quality of an item is never more than 50
- "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
- "Backstage passes", like aged brie, increase in Quality as their SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

- "Conjured" items degrade in Quality twice as fast as normal items

Just for clarification, an item can never have its Quality increase above 50, however "Sulfuras" is a legendary item and as such its Quality is 80 and it never alters.

## What We Need to Do

There are a few bugs abound from Leeroy's work still that will need to be cleaned up eventually:

1. Tapping "Next Day" doesn't increment our goods' quality or sellIn values.
2. If we try to add a new item, it doesn't appear on our list of inventory.
3. The overflow state in the ItemViewController seems to not be working right. We need the item titles to word wrap, not truncate off the end of the screen.
4. We don't even know what's happening in the Gilded Rose class's updateQuality method; that really needs to be cleaned up.
5. There might be some funny business happening in the unit tests as well...

We wanted to make some UI improvements as well, once we take care of those bugs:

1. When the user opens an Add Item view, a keyboard should show up immediately for the name field so the user can start typing right away.
2. We should add a feature to give the user a "Next"/"Done" button for the keypads when they're filling out Quality and SellIn values for a new item. Give the user a "Next" button on SellIn that changes focus to the Quality field, and a "Done" button on Quality that dismisses the keyboard and makes everything lose focus.

## Architecture

This app uses a basic MVC architecure. The `Items` in the app are backed by Core Data. There are several methods in the `AppDelegate` that help with managing Core Data changes.

## How to use this repository

- Simply clone the repo onto your machine and open the project in Xcode.
- Feel free to make any changes to any file in the project and add any new code as long as everything still works correctly (you can make the UpdateQuality method static if you like).

