# TheNoows #

This project contains the source code for the application that was previously available at thenoows.com. I no longer own the domain and have decided to open source the code for the project.

## About TheNoows ##

I created TheNoows because I was deeply unsatisfied with Digg during the 2008 election. At the time it seemed ALL pro-Obama posts were getting up-voted and anything that put Obama in a negative light was being down-voted into oblivion. I didn't feel that this was really a fair representation of the political climate at the time, and it kind of made Digg seem really one-sided. Plus, the comments on the various posts wasn't really helping further **actual** discussion either, just a bunch of trolling from both sides.

I needed to solve two problems with The Noows, I wanted to eliminate the ability for others to submit stories, and remove the ability to game the site.  The first one is easy to solve, and I did it by just relying on the RSS feeds from official news sources (CNN, MSNBC, Fox News, and eventually newspapers and such).  The idea was to remove the ability for people to submit their own articles, thus removing the need for them to game the site.

The second solution is currently two-fold. First, I rely on Facebook authentication for user creation and login. Since most people really only have one Facebook account, they can’t create multiple accounts on the site without also creating multiple Facebook accounts.  This (hopefully) makes it more trouble than it’s worth at the moment for a person to want to “game” the site to make sure certain articles are seen.

The second part of the solution is that there is currently no algorithm. You click the “Noows?” button, that article gets moved to the top of the homepage. Doesn’t matter if it’s already on the homepage or not, it gets bumped to the top.  The idea here is that the stuff a lot of people really think is news worthy will always be at the top of the site.  Will there eventually be an algorithm to determine what goes to the top? It’s possible, depends on what people want and if I ever see a real need for it.

## What Happened ##

The reason the site never evolved is largely due to the fact that I just ran out of time. There are so many hours in a day and with my various commitments, projects, and side work there just wasn't enough time to fit it all in.

I would have loved to eventually add an algorithm to better determine what makes the front page. Also the ability to distinguish a news article or source as left, right, or center was another feature wish I had.

The main principle was to have a news site that couldn't easily be gamed.

## What's Here ##

Contained here is the actual code I deployed (with some minor modes to fix small issues). There's not much to this as the site never had any algorithms for determining what made the front page. The idea was to eventually add an algorithm, but I just never got around to it.  There's code (Rails, HTML, CSS, & Javascript), and that's pretty much it.

** NOTE ** The Facebook settings in the config/facebook.yml point to a Facebook application that no longer exists. It was strictly for development anyway, but I deleted to be on the safe side. You'll need to set up a Facebook app in their developer section to make the app work as is since it requires Facebook for authentication.
