#!/bin/bash
#docker run -i -t -d --name=postgres postgres:odoo /bin/bash
docker run -t -i -p 8069:8069 --name odoo8 --link postgres:postgres -v ./addons:/opt/openerp/addons odoo8 /bin/bash
#docker run -t -i -p 8069:8069 --name odoo8 -v ./addons:/opt/openerp/addons odoo8 /bin/bash
#docker run -t -i -p 8069:8069 --name odoo7 -v ./addons:/opt/openerp odoo7 /bin/bash
