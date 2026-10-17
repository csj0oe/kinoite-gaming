#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Install packages

# enable rpmfusion repos and add copr repos
dnf config-manager setopt rpmfusion-nonfree-steam.enabled=1
dnf -y copr enable bieszczaders/kernel-cachyos
dnf -y copr enable bieszczaders/kernel-cachyos-addons
dnf -y copr enable @xlibre/xlibre-xserver

# latest updates
dnf -y distro-sync --refresh --allowerasing

# cachyos kernel and settings
dnf -y remove kernel-core zram-generator-defaults
dnf -y install kernel-cachyos cachyos-settings
#dnf -y install kernel-cachyos-devel-matched scx-manager

# xlibre server and plasma-x11 session
dnf -y install xlibre-xserver-Xorg plasma-workspace-x11

# install steam
dnf -y install steam gamescope mangohud

# misc
dnf -y group install development-tools
dnf -y install fastfetch btop nvtop stow
