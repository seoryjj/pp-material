# Lab Session, Principles of Programming #

2013/10/30 (Wed) 16:00-17:50
TA [Sungkeun Cho](http://ropas.snu.ac.kr/~skcho), [Jeehoon Kang](http://ropas.snu.ac.kr/~jhkang)

Let's look into environment and memory model.

### Environment and Memory ###

Environment is a map from variables to locations. Memory is a map from locations to values. For example (from Professor's slide 3),

![env-mem](fig-env-mem.png)

in the first environment, ```x``` points to a location and the
location points to tha value ```1```. Similary for ```y``` to ```2```.

In the third environment, ```y``` points to a location, and the
location points to a pair(```cons```), first(```car```) of which
points to 2 and second(```cdr```) of which points to a location of
another pair. In the picture, you can see ```x``` in the fourth
environment points to the same location.

### Counter ###

As you learned environment and memory in class and reviewed in lab
session, let's see an example: [Counter](counter.rkt).

```create-counter``` outputs a function. The function increases
internally stored ```n``` and returns it. After ```c``` is defined,
the environment and the memory look like as follows. Note that the
current environment is pin-pointed. Also note that when a
function(```c```) becomes a value, the current environment is stored
in the function value.

![env1](env1.png)

After ```d``` is defined, the environment and the memory look like as
follows.

![env2](env2.png)

Now you may understand why program runs as commented. Functions
```c``` and ```d``` assigns different locations to ```n```, so they
operate separately.

### Finite State Machine, re-revisited ###

Re-reimplement the vending machine. This time, most of all
implementation is already provided, and you have to fill in a small
piece. You can easily do that if you understand envirnment and memory
well.

See [Skeleton](fsm.rkt) and do ```'TODO```s. Your code should results
in ```#t``` when run.

As in the previous session, FSMs are **objects**. In this time,
however, we create an fsm with function ```create-fsm```. The skeleton
has two fsms, and you have to make both of them works well.

Before and after implementation, think of how will environment and
memory change. After ```create-fsm```ed, the environment and the
memory may look similar to:

![env3](env3.png)
