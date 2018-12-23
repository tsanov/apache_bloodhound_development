**Apache Bloodhound Shell Development**

Provides runtime environment for execution of apache bloodhound 0.8 during development. This does not use a WEB server (e.g. apache, nginx, etc.), it uses Python's built in web server. All examples are tested under Ubuntu 18.04.
---

Building (make sure you're sitting inside the directory containing the Dockerfile):

docker build . --tag bloodhound

Spinning a container based on the bloodhound image:

docker run -p 8000:8000 bloodhound

To make sure the container is up (this would look different in your environment):

$ docker ps

CONTAINER ID IMAGE COMMAND CREATED STATUS PORTS NAMES
37d82637c5aa bloodhound "tracd --port=8000 /…" 3 minutes ago Up 2 minutes 0.0.0.0:8000->8000/tcp hungry_shaw

To find out the IP address of the container (make sure the sha was replaced by the one you've got above):

$ docker inspect 37d82637c5aa | grep IPAddress

"SecondaryIPAddresses": null,
"IPAddress": "172.17.0.2",
"IPAddress": "172.17.0.2",

To make sure the bloodhound container responds (make sure the IP was replaced by the one you've got above, as well as that you've got curl on the machine running docker):

```
$ curl 172.17.0.2:8000

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Available Projects</title>
</head>
<body>
<h1>Available Projects</h1>
<ul>
<li>
<a href="/main" title="My example project">main</a>
</li>
</ul>
</body>

```

