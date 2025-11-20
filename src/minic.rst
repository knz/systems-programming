=======
 MiniC
=======

Deadline: September 5th, 2014

.. sectnum::

Instructions
============

1. Read and study the C coding standard that accompanies the course.
2. Teach yourself the basics of the Unix environment, if necessary using
   the tutorial linked in `References`_ below.
3. Do the programming assignment described below.

Programming assignment
======================

The teaching goal of this assignment is to get used to the C
programming environment and learn the basic of how libraries work.
What you must do, in a nutshell:

- implement ``my_strlen`` and ``my_strcmp``;
- implement a test program that uses these two functions;
- create a ``Makefile`` containing rules to build a library containing
  the two functions, and the test program.

The two functions
-----------------

You must implement the following two functions:

.. code:: c

   unsigned long my_strlen(const char *s);
   int my_strcmp(const char *s1, const char *s2);

- ``my_strlen`` must behave like the function ``strlen`` from the
  standard C library. See ``strlen(3)`` for details.
- ``my_strcmp`` must behave like the function ``strcmp`` from the
  standard C library. See ``strcmp(3)`` for details.
- ``my_strlen`` must be implemented in a file named ``my_strlen.c``.
- ``my_strcmp`` must be implemented in a file named ``my_strcmp.c``.
- the two function prototypes must be declared in a ``.h``
  file, in accordance with the C coding standard.
- you must not include any system header in your code.
- you must not use any function from the C standard library in your code.

The test program
----------------

You must implement a program which takes either one or two
arguments on the command line:

- if one argument is provided, it must return its length as exit code.
- if two arguments are provided, it must return the result of their
  comparison as exit code.

The program must be implemented in a file named ``test.c``. Again, you
must not include any standard/system header nor use any function from
the standard C library.

The ``Makefile``
----------------

Your ``Makefile`` must contain rules to build:

- ``libminic.a``, a static library containing the two functions;
- ``test``, the test program, linking with ``-lminic``.

Ensure that your ``Makefile`` also follows the section “Build rules”
in the C coding standard.

Grading
=======

- 8 if you have implemented ``my_strlen``, ``my_strcmp`` and the test
  program as instructed and the implementation is correct.
- 10 if you have completed all the programming assignment
  successfully.
- 1 otherwise.

References
==========

- The C coding standard provided with the course.
- The online Unix manual; ``man(1)``.
  http://en.wikipedia.org/wiki/Man_page
- Raphael Poss. Tutorial “Introductie Unix”, University of Amsterdam.
  http://staff.science.uva.nl/~poss/intro-unix.html
- Carols Fenollosa. Unix Tricks. http://cfenollosa.com/misc/tricks.txt

----

Copyright and licensing
=======================

Copyright © 2014, Raphael ‘kena’ Poss.  Permission is granted to
distribute, reuse and modify this document and other documents for the
Systems Programming course by the same author according to the terms
of the Creative Commons Attribution-ShareAlike 4.0 International
License.  To view a copy of this license, visit
`http://creativecommons.org/licenses/by-sa/4.0/
<http://creativecommons.org/licenses/by-sa/4.0/>`_.
