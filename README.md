Dockerfile for pligg
====================

**Last Pligg version tested: 2.0.2**

Pligg is an open source CMS that powers news and and user feedback websites.

Running it
----------

You can run the containers by hand, but I am using a `fig.yml` for that.

    $ MY_BASE_URL="http://hostname" \
      MYSQL_ROOT_PASSWORD=test \
      MYSQL_PASSWORD=$MYSQL_ROOT_PASSWORD \
      fig up

This will launch a MySQL database and an Apache2 server.

You should have realised about all that environment variables that I am
setting, the only one of those which is kinda "optional" is the `MY_BASE_URL`.
It seems that Pligg requires to know the host were it's running to serve static
assets as CSS or JS.

I have a tip here. I am running with boot2docker so something like this could
help you to easily setup the hostname:

    $ MY_BASE_URL=http://`boot2docker ip` ...

First time installation
-----------------------

First time that you go through this process you will need to create an admin
user and repeat some parameter and steps that were already done on the
`Dockerfile`. The good part is that I had a shortcurt for you:

### Using the dump and removing the `install` folder

I've created as this:

- English language.
- a user called "admin" with the password "admin" and the email
  "admin@example.com".
- "Pligg" as sitename.

Don't worry, you can change those values later. So, if you want a quick start follow the following steps (remember that MSYQL\_PASSWORD var must be set):

    $ docker exec dockerpligg_db_1 \
      mysql -u pligguser -p$MYSQL_PASSWORD dbpligg < "`cat pligg.sql`"

And now remove the `install` folder:

    $ docker exec dockerpligg_web_1 rm -rf /var/www/html/install

### Manual process

If you want the manual process, just go to `http://1.2.3.4/install` (where
`1.2.3.4` is the IP of your installation) and follow the steps.

After do that you will need to removed the `install` folder as well.
