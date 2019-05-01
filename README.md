# Simple Chrony Container #

![clock picture](https://raw.githubusercontent.com/geoffh1977/chrony/master/images/clock.png)

## Description ##
This docker image provides a small chrony (NTP) image which will sync the local hardware clock and provide access to an NTP time service. It contains a basic chrony configuration file which attaches to the global NTP server pool.

## Running The Container ##

In order for the chrony service to operate correctly, the following command is required. Access needs to be granted to the SYS-TIME capability.

`docker run -d --rm --cap-add SYS_TIME -p 123:123/udp geoffh1977/chrony`

You can place the container in interactive mode by replacing the "-d" switch with "-it". You can also use your own config by overwriting the /etc/chrony.conf file with "-v".

### Getting In Contact ###
If you find any issues with this container or want to recommend some improvements, fell free to get in contact with me or submit pull requests on github.
