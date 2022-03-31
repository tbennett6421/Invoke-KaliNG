# Getting started with salt

## Structure
In a typical saltstack deployment, you install `salt-master` on a master node and `salt-minon` on minion nodes. These minion nodes communicate back to the master using a transport protocol (usually `zeroMQ`). Salt can also use SSH as a transport protocol but it suffers from performance and scalability issues.

Master and minion configuration's live within `/etc/salt/`. This folder contains the configuration of each respective component and associated identity information.

The master node will usually have a directory structure for codified infrastructure that looks like this.

```
/srv/
    /salt/
          <file1>.sls
          <dir1>/
          <dir2>/
          top.sls
    /pillar/
          <file1>.sls
          <dir1>/
          <dir2>/
          top.sls
```

This is how we will configure desired state configuration within this repo and use masterless salt

# Installation
## Install masterless salt

```sh
sudo apt-get install salt-common
```

Once salt-common is installed, one of the utilities it provides is `salt-call`. The following is how to call the salt engine in masterless mode and give it our codified instructions.

```sh
salt-call --local state.apply --file-root SaltStack/salt --pillar-root SaltStack/pillar
git pull && salt-call --local state.apply --file-root SaltStack/salt --pillar-root SaltStack/pillar --out-file output.state --no-color
```
