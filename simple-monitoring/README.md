


## Simple Monitoring
Set up a basic monitoring dashboard using Netdata.


Sample solution for [Simple Monitoring](https://roadmap.sh/projects/simple-monitoring-dashboard)
This project is part of [roadmap.sh](https://roadmap.sh/projects) DevOps projects.


### Steps to setup Netdata on a Linux server

**Clone the repository**

```sh
git clone https://github.com/ashif8984/roadmap-projects.git
cd simple-monitoring
```

✅ **Install Netdata**

1. Run the below installation script for netdata
```sh
wget -O /tmp/netdata-kickstart.sh https://get.netdata.cloud/kickstart.sh && sh /tmp/netdata-kickstart.sh --no-updates --stable-channel --disable-telemetry
```

✅ **Access Dashboard**

1. First open port for 1999 on the VM instance
2. Access the dashboard http://<INSTANCE_SERVER>:19999/

✅ **Setup custom chart**
1. Click on Dashboard
2. Add Chart to add new chart
3. Select the metrics for the chart- app.cpu_utilization

✅ **Setup alert for a metrics**

1. Update the below file to customize the upper/lower limit of CPU metrics
```sh
sudo vi /usr/lib/netdata/conf.d/health.d/cpu.conf

Update the below limits for warn and crit
       warn: $this > (($status >= $WARNING)  ? (75) : (85))
       crit: $this > (($status == $CRITICAL) ? (85) : (95))

```
2. Save the file and reload Netdata's health configuration to apply your changes.

```sh
sudo netdatacli reload-health
```
✅ **Create load on the system**

1. We can increase the CPU load using many different ways, one of which is stress

```sh
# install
sudo apt install stess

# Add cpu load
stress --cpu 3
```
✅ **Created deployment script**

```sh
# setup.sh: A shell script to install Netdata on a new system.
In-progress
# test_dashboard.sh: Script to put some load on the system and test the monitoring dashboard.
In-progress
# cleanup.sh: Script to clean up the system and remove the Netdata agent.
In-progress
```



🔗 References for Netdata
[Offical Page Netdata](https://learn.netdata.cloud/docs/alerts-&-notifications/alert-configuration-reference)
[Documentation for Netdata](https://github.com/netdata/netdata)

