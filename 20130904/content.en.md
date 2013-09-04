# Lab Session, Principles of Programming #

4th Sep. 2013 (Wed) 16:00-17:50  
TA [Sungkeun Cho](http://ropas.snu.ac.kr/~skcho),
[Jeehoon Kang](http://ropas.snu.ac.kr/~jhkang)

## Introduction ##

Welcome, students of Principles of Programming! In lab session,
you are going to grasp hands-on experience on concepts on programming
you've taught in the lecture session.

### Time/Place ###
* lab session will be at Bldg 302 Rm 311-2 every Wednesday.
* TA's office hour is Mon/Wed 15:00-16:00 (right before class). Visit
  at Bldg 302 Rm 312-2 Programming Laboratory.
  + You may visit during the office hour.
  + In other circumstances, visit after making appointment with TA by
  email.

### Materials ###

* [Course page](http://ropas.snu.ac.kr/~kwang/4190.210/13/): A page
  maintained by Prof. Yi. Homework, readings, and notices.
* [TA page](http://ropas.snu.ac.kr/~ta/4190.210/13/): A page
  maintained by TAs. lab sessions and grading.
* [Board](https://ropas.snu.ac.kr/phpbb/viewforum.php?f=30): Online
Q&A. If you want to ask on course materials, please do here.
  + **Important**: All students should sign on the board by their
  **real name**.
* [Lab materials](http://www.github.com/lunaticas/pp-material):
  All lab materials are stored here. TAs will provide links from
  the TA page and the board, so you don't have to look at it.

### Used Language ###

* In lab session, you will use [Racket](http://racket-lang.org)
and [Ocaml](http://caml.inria.fr). We will start with Racket.

### Lab Session ###

#### Lab Team ####

* We will organize teams each of which consists of 3-4 students.
* Members are not changed during this class, except for extraordinary
  cases.
  
#### Lab Session Procedure ####

* TAs will give you materials.
* You will do the labwork with your team members.
* If you have a question, ask to fellow team members. If the issue is
  not resolved in the team, ask to TAs.
* If you write down the your answer, grade the answer by yourself with
  self-grader (presented by TAs).
* If the self-grader says correct for all your team members, AND all
your team members understood the material well, ask TAs.
* After TAs check your team, you may leave :-)
  + TAs will check thoroughly if all team members understood well!

### Homework ###

* You will do your homework by yourself (homework is not a team assignment).
* TAs will give you self-graders for homework and projects.
  + Self-graders are only for testing input/output formats, and real
  grading is not performed by this self-graders.
  + Warning: as TAs provide self-graders, **TAs will not give you any
  scores if you fail to fulfill input/output specifications**.
* Submit homeworks and project at
[homework submission](http://ropas.snu.ac.kr/~ta/4190.210/13/hw/)
page.
  + As the same with labwork, **Submit here** except for
  extraordinary circumstances.
* You get 90% of your score if you submit no later than 24hrs after
  the deadline; 80% for 48 hrs.
  + As the same with labwork, the only the lastly submitted answer is
  counted for.
* TAs will provide actual graders 48hrs after the deadline. After this,
  you will get 50% of reduced score if you submit a **correct** answer
  in 24hrs after the actual grader provision.
  + by correct is meant 100% score from the actual grader.
  + ex1) score was 80 and a correct answer was sumitted later: 80 + (20 * 0.5) = 90
  + ex2) the same with the above except for 24hrs delay: (80 * 0.9) + (20 * 0.5) = 82

## Racket ##

### Installation ###

Download [Racket v5.3.6](http://racket-lang.org/download/) and install
it.

* **Caution**: Use **v5.3.6 only** in this class. TAs grade your
    submissions with this version.
* Racket is already installed in this room.

### Hello, World! ###

Today, you will write down a program which write down "Hello, World!".
As it is the first day, TAs provided the [solution](helloWorld.rkt)
:-)  
You're not required to understand this program for now.

* The link above points to not the file itself but a page on the
file. If you click "Raw" in the page, you will get the file itself.

#### Self-grader ####

Download [self-grader](helloWorldGrade.rkt) and put it at the same
directory with `helloWorld.rkt`. Open `helloWorldGrade.rkt` and run
it. If an `O` comes out, you succeeded in self-grading!

* Filename should be `helloWorld.rkt` or grader won't work. In
  Linux, you should match the cases.
* You may run in the command line by:
`racket helloWorldGrade.rkt`  


#### Submission ####

At [Labwork submission](http://ropas.snu.ac.kr/~ta/4190.210/13/lab/)
page, submit `helloWorld.rkt` as No. 1.

## Tools ##

Not mandatory but useful.

### Revision control ###

* [Git](http://www.git-scm.com)
  + [Git the simple guide](http://rogerdudler.github.io/git-guide/index.html)
  + [Git from the bottom up](https://www.google.co.kr/search?client=safari&rls=en&q=git+from+bottom+up&ie=UTF-8&oe=UTF-8&gws_rd=cr&ei=06ckUqKJGYXAkAX1jYAw):
* [Mercurial](http://mercurial.selenic.com)
* [Subversion](http://subversion.tigris.org)

### Editors ###

* [Emacs](http://www.gnu.org/s/emacs/)
* [Vim](http://www.vim.org)
* [UltraEdit](http://www.ultraedit.com)
* ...
