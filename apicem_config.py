# Step 1
# Change apic-em IP to the one you are using
# apicem_ip =  "sandboxapic.cisco.com"
# apicem_ip is a string

import os         # For passing arg from Docker

if 'APICEM_IP' in os.environ:
    APICEM_IP = os.environ['APICEM_IP']
else:
    APICEM_IP = "devnetapi.cisco.com/sandbox/apic_em"



# Step 2
# Eneter user name and password to get a service ticket
# If you assign username, password and version here you don't need to pass parameter when calling

if 'APICEM_USER' in os.environ:
    USERNAME = os.environ['APICEM_USER']
else:
    USERNAME = "devnetuser"

if 'APICEM_PASSWORD' in os.environ:
    PASSWORD = os.environ['APICEM_PASSWORD']
else:
    PASSWORD = password = "Cisco123!"

VERSION = "v1"
