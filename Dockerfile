FROM python:2
RUN mkdir -p /opt/bloodhound
RUN cd /opt/bloodhound
WORKDIR /opt/bloodhound
RUN curl -SL "ftp://mirror.csclub.uwaterloo.ca/apache/bloodhound/apache-bloodhound-0.8.tar.gz" -o bloodhound.tar.gz
RUN tar -xzvf bloodhound.tar.gz
RUN pip install --upgrade pip
RUN mv apache-bloodhound-0.8 0.8
RUN cd /opt/bloodhound/0.8/installer
WORKDIR /opt/bloodhound/0.8/installer
RUN pip install -r requirements.txt
RUN python bloodhound_setup.py --database-type=sqlite --admin-user=admin --admin-password=admin
CMD ["tracd", "--port=8000", "/opt/bloodhound/0.8/installer/bloodhound/environments/main"]
