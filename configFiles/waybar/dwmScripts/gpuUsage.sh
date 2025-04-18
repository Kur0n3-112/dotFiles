#!/bin/bash

nvidia-smi | grep Default | awk '{print $13}'
