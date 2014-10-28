FROM debian:wheezy
 
RUN echo 'Acquire::http { Proxy "http://172.17.42.1:3142"; };' > /etc/apt/apt.conf.d/02aptproxy

RUN echo "deb http://ftp.debian.org/debian wheezy main contrib non-free" > /etc/apt/sources.list
RUN echo "deb http://security.debian.org/ wheezy/updates main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y locales --force-yes && rm -rf /var/lib/apt/lists/* && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN apt-get update
 
RUN apt-get install -y openssh-server supervisor python-setuptools python-pip python-httplib2 python-unidecode screen vim wget less

#Supervisor
ADD sshd.conf /etc/supervisor/conf.d/sshd.conf
 
RUN mkdir -p /var/run/sshd
 
RUN echo "root:123456" | chpasswd
 
EXPOSE 22

CMD /usr/bin/supervisord -n

##############################################################################
# Postgresql

#RUN apt-get install -y postgresql --force-yes

#su -c "pg_dropcluster --stop 9.3 main" postgres
#su -c "LANG=en_US.UTF-8 pg_createcluster --start 9.3 main"

##############################################################################

##############################################################################
#Openerp 7
#RUN service postgresql start && su - postgres -c "createuser -s openerp"
#
#RUN apt-get install -y postgresql-client python-dateutil python-docutils python-feedparser python-gdata python-imaging python-jinja2 python-ldap python-libxslt1 python-lxml python-mako python-mock python-openid python-psutil python-psycopg2 python-pybabel python-pychart python-pydot python-pyparsing python-reportlab python-simplejson python-tz python-unittest2 python-vatnumber python-vobject python-webdav python-werkzeug python-xlwt python-yaml python-zsi --force-yes
#
#ADD openerp_7.0-20140804-231303-1_all.deb /opt/openerp_7.0-20140804-231303-1_all.deb
#
#RUN dpkg -i /opt/openerp_7.0-20140804-231303-1_all.deb
#
#ADD openerp-server.conf /etc/openerp/openerp-server.conf
#
#RUN easy_install prestapyt mandrill

##############################################################################

##############################################################################
#OpenERP 8
#RUN service postgresql start && su - postgres -c "createuser -s odoo"

RUN echo "deb http://nightly.odoo.com/8.0/nightly/deb/ ./" >> /etc/apt/sources.list

RUN apt-get update

RUN apt-get install -y odoo --force-yes

ADD odoo-server.conf /etc/odoo/openerp-server.conf

##############################################################################

EXPOSE 8069
