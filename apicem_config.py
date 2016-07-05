# Step 1
# Change apic-em IP to the one you are using
# ip =  "sandboxapic.cisco.com"

import os         # For passing arg from Docker

if 'APICEM_IP' in os.environ:
    ip = os.environ['APICEM_IP']
else:
    ip = "devnetapi.cisco.com/sandbox/apic_em"



# Step 2
# Eneter user name and password to get a service ticket
# If you assign username, password and version here you don't need to pass parameter when calling

if 'APICEM_USER' in os.environ:
    username = os.environ['APICEM_USER']
else:
    username = "devnetuser"

if 'APICEM_PASSWORD' in os.environ:
    password = os.environ['APICEM_PASSWORD']
else:
    password = password = "Cisco123!"

version = "v1"
