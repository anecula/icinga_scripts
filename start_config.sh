#!/bin/sh

chmod +x minion_node.sh
./minion_node.sh && systemctl restart icinga2.service
