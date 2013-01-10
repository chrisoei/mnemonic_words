## Sample Usage
```ruby
$ irb
2.0.0dev :001 > mw = MnemonicWords.new(
2.0.0dev :002 >     (0..9999999999), # Specify valid range is ten digits
2.0.0dev :003 >     0.01             # Maximum chance of undetected error is <= 0.01
2.0.0dev :004?>   )
< n: 4, -log10(p): 3.489438330097295 >
2.0.0dev :005 > mw.encode(4155551212)
"muscle hesitate trust two"
2.0.0dev :006 > mw.decode("muscle hesitate trust two")
4155551212
2.0.0dev :007 > mw.decode("muscle hesitate two trust") # Introduce an error
nil                                  # If an error is detected, result is nil
```

## Credits
Special thanks to Alan Blanchard, Jon Hamkins, and Clark Brooks
for helping me think through the error detection stuff.

## Donations

Bitcoin donation address: 1MWeioFdnwFZC8eqJwxjKcA3SErKxEBu8V

