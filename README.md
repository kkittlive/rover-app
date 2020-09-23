# Mars Rover

Code challenge completed by Janette Kwan

## Summary

* Specify the dimensions of a plateau on Mars
* Drop as many rovers as you'd like onto this plateau
* Specify each rover's starting location and orientation, and specify each rover's route
* The resulting position of all your rovers will be returned

## Usage

* Run `git clone https://github.com/kkittlive/rover-app.git` to download this repo to your local environment
* Run `cd rover-app` to be sure you're in this proper directory
* Run `gem install bundler && bundle install` to install dependcies
* Run `bundle exec rspec` to execute the tests
* **Run `ruby app.rb` to execute the app**

> See my initial super quick solution at: <https://github.com/kkittlive/rover>

## Example

Detailed instructions are printed at each step as you walk through the app. Here's an example:

```
------------------------------------------------
Welcome to jkwan's Mars Rover app.

--------
How many coordinates wide and tall would you like this plateau to be?
(e.g. for 5 x 5, type '5 5' and hit enter)
> 5 5
Right on! So our plateau is 5 wide (x-axis) by 5 tall (y-axis).

--------
Where on this plateau would you like your rover to be plopped, and facing which direction?
You can enter any coordinates from '0 0 ' up to '5 5',
and you can specify the direction with either 'N', 'E', 'S', or 'W'.
So we'll want to enter something like: '1 2 N' or '3 3 E'.
> 1 2 N

--------
Awesome. So starting from x = 1 and y = 2, facing N, what's the route we'd like this rover to navigate?
We can type 'L' for the rover to turn left (rotate 90deg counter-clockwise, without otherwise moving),
'R' to turn right, and 'M' to move forward one step (in the direction they're already facing).
Any M's that will cause the rover to fall off the plateau will be skipped
So we'll want to enter something like: 'LMLMLMLMM' or 'MMRMMRMRRM'.
> LMLMLMLMM

--------
Would you like to plop another rover on this plateau? Enter 'Y' or 'N'
> Y

--------
Where on this plateau would you like your rover to be plopped, and facing which direction?
> 3 3 E

--------
Awesome. So starting from x = 3 and y = 3, facing E, what's the route we'd like this rover to navigate?
> MMRMMRMRRM

--------
Would you like to plop another rover on this plateau? Enter 'Y' or 'N'
> N

--------
Here are the resulting whereabouts of your rover(s):
1 3 N
5 1 E
Thanks for visiting Mars!
------------------------------------------------
```
