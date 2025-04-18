#!/bin/bash

sensors | grep k10temp-pci-00c3 -C 3 | grep Tccd1  | awk '{print $2}' | tr -d 'Tccd:' | tr -d ' ' | tr -d '+'
