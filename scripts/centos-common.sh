#!/bin/bash

# run yum to update but exclude kernel updates
yum update -y --exclude=kernel

#tools
yum install -y nano git unzip screen nc telnet
