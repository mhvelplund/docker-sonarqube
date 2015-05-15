# SonarQube

In addition to Docker (and possibly Boot2docker), this build requires [Docker Compose](http://docs.docker.com/compose/).

The first time you run the application you must pick a root password for the database like this:

    MYSQL_ROOT_PASSWORD=mysupersecretpw docker-compose up -d

To stop the application use "```docker-compose stop```". Later the, the app can be started using "```docker-compose up -d```". 
Note that docker-compose must be run in the application directory.

The DB can be reached on port 13306 using the root login with the password chosen earlier.

The web server can be reached on port 9000.

On OSX, simply type:

    open http://$(boot2docker ip):9000

Note that the DB server exposes its data a volume which can be mounted by other images.

Sonar is setup using database username/password "sonar" and in the "sonar" scheme.

Once up and running, the Sonar server's canbe adminsitrated with user "admin", pw "admin".

This image was based in part on [jahroots/sonarqube](https://registry.hub.docker.com/u/jahroots/sonarqube/)
