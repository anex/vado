#!/bin/bash
docker run -t -i -p 8069:8069 -v /addons:/opt/openerp/addons odoo7 /bin/bash
