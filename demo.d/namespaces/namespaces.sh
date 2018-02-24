#!/bin/bash

echo "The hostname is:\n $(hostname)"
echo "The result of ip a is:\n $(ip a)"
echo "List of IPC Messages:\n $(ipcs -q)"
echo "Files and owners:\n $(ls -la)"
echo "The list of running processes is:\n $(ps aux)"


