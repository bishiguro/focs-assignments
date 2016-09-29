# FOCS Homework for Day 9

You may edit your answers into this file, or add a separate file in the same directory.

If you add a separate file, please include the following at the top:

```
Student Name: Bonnie Ishiguro
Check one:
[x] I completed this assignment without assistance or external resources.
[ ] I completed this assignment with assistance from ___
   and/or using these external resources: ___
```

## 1. For each of the following languages, decide whether it is regular

For each of the following languages, decide whether it is regular.  If it is regular, give a regular expression or finite automaton that recognizes the language.  If it is not regular, demonstrate that using the pumping lemma.

a) Strings containing only the symbol a whose length is a power of 2 (*i.e.* length 2^n)

Not regular.  If we start with the string 'a', the y (looping) substring has to be 'a'.  If y is looped three times, the string is no longer in the language, since 3 is not a power of 2.

b) All strings with an equal number of occurrences of the substrings `01` and `10`.

[010 is in this language; `000110` is in the language; `0101010` is in the language; but `010101` is not.]

c) All strings (over {0,1}) consisting of a substring _w_ followed by the reverse of the substring.

Not regular.  If we start with the string '101101', and choose the substring '10' to be y, the possible result '10110101' is not in the language.

## 2. Play the pumping game

Play the **pumping game** (referenced on the [Day 8 page](https://sites.google.com/site/focs16fall/in-class-exercises/day-8) and also found at [http://weitz.de/pump/](http://weitz.de/pump/)).  Solve at least two puzzles from that page (that do NOT appear in question 1, above) and provide the word you chose, the substring the computer chose, and your successfully pumped string.

L = {a^n | n is prime}
Word: aaaaaaaaaaaa
Computer's substring: aaaa
Pumped string: aaaaaaaaaaaaaaaaaaaaa

L = {a^n b^k a^(n+k) | k,n are natural numbers}
Word: aaaaaaaaabbbbbbbbbaaaaaaaaaaaaaaaaaa
Computer's substring: aaa
Pumped string: aaaaaaaaabbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

## 3. Create a PDA

For one of the non-regular languages in problem 1 or 2 above, create a PDA (preferably in JFLAP) and include it with your completed homework.

See anbk.png and anbk_run.png for PDA and JFLAP tests of L = {a^n b^k a^(n+k) | k,n are natural numbers}.

## 4. Reading

Optionally read Sipser pp. 101–125.

Optionally read Stuart pp. 128–134.

## 5. Install gprolog

Please download and install [gprolog](http://www.gprolog.org) before coming to class:

**Ubuntu**:

	$ sudo apt-get install gprolog

**Mac**, with [Homebrew](http://brew.sh) installed:

	$ brew install gnu-prolog

**Mac** without Homebrew, and **Windows**:

- Follow the instructions at [http://www.gprolog.org/#download](http://www.gprolog.org/#download).
