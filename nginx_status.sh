#!/bin/bash
case $1 in
active)
  curl -s http://127.0.0.1/status | awk 'NR==1{print $3}';;
accepts)
  curl -s http://127.0.0.1/status | awk 'NR==3{print $1}';;
waiting)
  curl -s http://127.0.0.1/status | awk 'NR==4{print $6}'
esac
