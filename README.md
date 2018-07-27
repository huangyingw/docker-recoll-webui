
docker-recoll-webui
===================


**Recoll**

it finds keywords inside documents as well as file names.
Project home : http://www.lesbonscomptes.com/recoll
<b>Recoll</b> is a great program written to index data on your computer, fileserver, remote-data. It uses the powerful <i>xapian-library</i> - Project home: https://xapian.org/

To check detailed features for <i>Recoll</i> check out : http://www.lesbonscomptes.com/recoll/features.html

This container will pull Debian Jessie, download Recoll source.list, then install all the needed dependencies. It will also pull the front end for this container, which is located at https://github.com/koniu/recoll-webui

<b>How to install</b>
1. Download the files to your computer, extract to a folder of choice, enter this folder
2. In terminal run `.start-container /path/to/your/local/collection/of/data` to start the created container
3. Access the docker-recoll-webui frontend at this address [http://172.17.0.2:8080](http://172.17.0.2:8080) if this is the only container you run.
   If you have more, you can get it's IP address by running ``docker inspect docker-recoll-webui | grep "IPAddress"``

Note on using the frontend: 
If you want to open a file in your browser after a successful query you might notice that the URL is incomplete. Check out the <i>settings</i> on the webpage from the container, here you can set the full path from your computer, which you
