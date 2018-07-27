
docker-recoll-webui
===================


**Recoll**
==========

it finds keywords inside documents as well as file names.
Project home : http://www.lesbonscomptes.com/recoll
<b>Recoll</b> is a great program written to index data on your computer, fileserver, remote-data. It uses the powerful <i>xapian-library</i> - Project home: https://xapian.org/

To check detailed features for <i>Recoll</i> check out : http://www.lesbonscomptes.com/recoll/features.html

This container will pull Debian Jessie, download Recoll source.list, then install all the needed dependencies. It will also pull the front end for this container, which is located at https://github.com/koniu/recoll-webui

<b>How to install</b>
1. Download the file `container-build.sh` to your computer. 

   On *Linux* `wget https://raw.githubusercontent.com/viktor-c/docker-recoll-webui/master/container-build.sh`   
2. Make this file executable

   On *Linux* `chmod u+x container-build.sh`
3. In terminal run `container-build.sh /path/to/your/local/collection/of/data` to build, then start the created container
4. Access the docker-recoll-webui frontend at this address [http://172.17.0.2:8080](http://172.17.0.2:8080) if this is the only container you run.
   If you have more, you can get it's IP address by running ``docker inspect docker-recoll-webui | grep "IPAddress"``

**Notes**
=========

1. Note on using the frontend: 
If you want to open a file in your browser after a successful query you might notice that the URL is incomplete. Check out the **settings** on the webpage from the container, here you can set the full path from your computer, which you
2. Even if you set this path, opening files in your browser might not work. This is a safety issue in Firefox, Chrome, Opera. You cannot open local files from a remove website. To workaround this, please check out the recoll-webui Readme [https://github.com/koniu/recoll-webui#opening-files-via-local-links]
3. On the first run of recoll in the collection folder it will also index the files. It can take more or less time, depending on where the files are located and how big the collection is.
