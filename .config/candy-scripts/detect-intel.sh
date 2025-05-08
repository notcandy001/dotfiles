#!/bin/bash
if lspci | grep -i 'vga' | grep -iq 'intel'; then
    echo "Intel GPU detected. Enabling iGPU optimizations..."
    echo "options i915 enable_guc=3" | sudo tee /etc/modprobe.d/i915.conf
    sudo mkinitcpio -P
else
    echo "No Intel GPU found or not supported."
fi
