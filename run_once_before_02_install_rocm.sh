#!/bin/bash

# Installing rocm-smi-lib only if the computer uses a AMD GPU (so it can be displayed in btop)
is_amd_gpu=$(lspci -k | grep -A 2 -E '(VGA|3D)' | grep 'Kernel driver in use: amdgpu')
if [ -n "$is_amd_gpu" ]; then
    yay -Sy rocm-smi-lib
fi
