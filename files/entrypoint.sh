#!/bin/bash

# make the root filesystem private
mount --make-rprivate /

# execute the unshare command
exec unshare --cgroup -- /bin/bash -lc '
  umount /sys/fs/cgroup
  mkdir -p /sys/fs/cgroup
  mount -t cgroup2 none /sys/fs/cgroup
  /escape-cgroup.sh
  /create-kubelet-cgroup.sh
  exec /lib/systemd/systemd
'
