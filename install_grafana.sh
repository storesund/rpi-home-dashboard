#! /bin/sh
echo  "NB: Remember to first run apt-get update and apt-get upgrade."
is_armv6=$(grep -ic armv6 /proc/cpuinfo)
if [ "$is_armv6" -eq 1 ]
then
    echo  "We are currently on ARMv6 architecture."
    echo  "Installing Grafana for ARMv6..."
    sudo apt-get install -y adduser libfontconfig1
    wget https://dl.grafana.com/oss/release/grafana-rpi_6.7.1_armhf.deb
    sudo dpkg -i grafana-rpi_6.7.1_armhf.deb
else
    echo  "Unknown arcitechure. Exiting.."
fi
echo "Activating grafana for automatic startup on boot..."
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable grafana-server
echo "Starting grafana right now..."
sudo systemctl start grafana-server
echo "Done. Note that startup takes a little while."
