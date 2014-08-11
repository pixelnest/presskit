presskit() for Pixelnest
========================

## How to run?

Install [Vagrant](http://www.vagrantup.com/downloads.html).

Then, open your shell and:

```shell
cd /path/to/this/repo/
vagrant up
```

Warning: provision the vagrant machine ONLY ONCE.

## Export

Run:

```shell
vagrant ssh -c /pxn/presskit/convert
```

Then, modify the exported files.

## Test

To test the result:

```shell
jekyll serve -w
```
