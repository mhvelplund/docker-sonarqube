# SonarQube

In addition to Docker (and possibly Boot2docker), this build requires [Fig](http://www.fig.sh).

The first time you run the application you must pick a root password for the database like this:

    MYSQL_ROOT_PASSWORD=mysupersecretpw fig up -d

To stop the application use "```fig stop```". Later the, the app can be started using "```fig up -d```". 
Note that fig must be run in the application directory.

The DB can be reached on port 13306 using the root login with the password chosen earlier.

The web server can be reached on port 9000.

On OSX, simply type:

    open http://$(boot2docker ip):9000

Note that the DB server exposes its data a volume which can be mounted by other images.

Sonar is setup using username/password "sonar" and a database "sonar"

This image was based in part on [jahroots/sonarqube](https://registry.hub.docker.com/u/jahroots/sonarqube/)