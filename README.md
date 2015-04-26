# Analyzing Shakespeare

Difficulty: **Easy, but requires isolating an external service during testing.**

As a Shakespeare buff, statistics junkie, and Unix lover, Ben finds himself wanting a command-line tool for analyzing Macbeth.

Write a command-line program that prints the number of lines spoken by each character in Shakespear's play Macbeth.

---

### Setup instructions

Fork and setup the exercise repository:

```
git clone <YOUR FORK ADDRESS>
cd analyzing-shakespeare
bin/setup
```

---

### Exercise instructions

Sample usage/output (using made-up numbers):

```
$ ruby macbeth_analyzer.rb
  543 Macbeth
  345 Banquo
  220 Duncan
  (etc.)
```

You can find an XML-encoded version of Macbeth here: [http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml](http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml). Your program should download and parse this file at runtime.

Your solution must be tested, preferably via TDD. Running your tests should not download the play from the ibiblio.org server.

**Note:** some lines are attributed to a speaker called "ALL". Your program should ignore these.

---

### Push Solution
Once you're finished, commit your changes and then push your solution to your fork:

```
git push origin master
```
