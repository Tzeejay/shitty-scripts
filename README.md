##Shitty shell scripts

[![CircleCI](https://circleci.com/gh/Tzeejay/shitty-scripts.svg?style=svg)](https://circleci.com/gh/Tzeejay/shitty-scripts)

Have you ever felt the need to understand what that fucking package manager you're using is actually doing to your system? Probably not, me neither up until very recently but I felt the need to explore a little and after trying to compile Ruby 2.3.1 by hand I were fed up by weird scripts that paste obscure variables into command calls at runtime.


These shitty shell script are supposed to change all of this. No more confusion, no more dependencies. Pick and choose what you want and leave everything else far far away from your system.



### Contributing

If you want to contribute your shitty shell script to this library of vast knowledge please make sure to follow these basic rules:

1. Some software can't be build without dependencies, so you may require certain things like eg: autoconf, automake !BUT you have to warn the user about it. Don't just install something "because I know what to do". Be transparent (comments in your shitty shell scripts) and excellent to the system your shitty shell script is running on.

2. !Always¡ download sources into `/src/` and cleanup after yourself.

3. Give concise instructions at the end regarding updating the $PATH or adding things to the `~/.profile` or `~/.bashrc`.
