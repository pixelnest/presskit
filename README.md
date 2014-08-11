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
vagrant ssh
cd /var/www/presskit

php index.php > /pxn/presskit/index.html
php style.css > /pxn/presskit/style.css

php bulletml_for_unity/index.php > /pxn/presskit/bulletml_for_unity/index.html
php shmupfest/index.php          > /pxn/presskit/shmupfest/index.html
php supermassive/index.php       > /pxn/presskit/supermassive/index.html
```

To test the result:

```shell
jekyll serve -w
```

TODO: shell script.
