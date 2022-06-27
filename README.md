# SpaceInvaders

This Ruby application takes a radar sample as an argument and reveal possible locations of known invaders.

## Usage

```
  $ cd space_invaders
  $ bin/track [path to invader file] [path to radar file] [accuracy] # with 0 < accuracy < 1
```

e.g. `bin/track "./lib/data/known_invaders/crab.txt" "./lib/data/radar_sample.txt" 0.75`

### Example output:

![example output](/docs/images/example-output.png)


### Run tests

`$ rspec`
