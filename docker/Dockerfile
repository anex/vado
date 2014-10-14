FROM debian:wheezy
 
RUN echo 'Acquire::http { Proxy "http://172.17.42.1:3142"; };' > /etc/apt/apt.conf.d/02aptproxy

RUN echo "deb http://ftp.debian.org/debian wheezy main contrib non-free" > /etc/apt/sources.list
RUN echo "deb http://security.debian.org/ wheezy/updates main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get upgrade
 
RUN apt-get install -y openssh-server supervisor python-setuptools python-pip python-httplib2 python-unidecode screen vim less wget

#Supervisor
ADD sshd.conf /etc/supervisor/conf.d/sshd.conf
 
RUN mkdir -p /var/run/sshd
 
RUN echo "root:123456" | chpasswd
 
EXPOSE 22

CMD /usr/bin/supervisord -n

#Openerp 7
RUN apt-get install -y postgresql postgresql-client python-dateutil python-docutils python-feedparser python-gdata python-imaging python-jinja2 python-ldap python-libxslt1 python-lxml python-mako python-mock python-openid python-psutil python-psycopg2 python-pybabel python-pychart python-pydot python-pyparsing python-reportlab python-simplejson python-tz python-unittest2 python-vatnumber python-vobject python-webdav python-werkzeug python-xlwt python-yaml python-zsi --force-yes

#RUN su - postgres -c "createuser -s openerp" 2> /dev/null || true

ADD openerp_7.0-20140804-231303-1_all.deb /opt/openerp_7.0-20140804-231303-1_all.deb

RUN dpkg -i /opt/openerp_7.0-20140804-231303-1_all.deb

ADD openerp-server.conf /etc/openerp/openerp-server.conf

RUN easy_install prestapyt mandrill

EXPOSE 8069

##OpenERP 8
#RUN echo "deb http://nightly.odoo.com/8.0/nightly/deb/ ./" >> /etc/apt/sources.list
#
#RUN apt-get update
#
#RUN apt-get install -y odoo --force-yes

#ONBUILD ADD addons /opt/openerp/addons
