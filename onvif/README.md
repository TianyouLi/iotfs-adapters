# ONVIF to OIC Converter

This is a prototype that simply convert ONVIF device - IP Camera - into OIC resource. Currently it support retrieve information from IP camera include rtsp url, and perform PTZ operation.

## How to Start

### Environment
The IoTFS-Adapters was built and tested under Ubuntu 14.04 amd64 system. Currently the ONVIF to OIC converter depends on Node.js so please make sure you have Node.js deployed and version >= 0.10.25.

### Build
1. Please make sure you have git clone iotfs-core project and successfully build it. 
2. Execute ${IOTFSADAPTER}/onvif/buildall.sh. This script will install required packages for build the ONVIF to OIC converter, then trigger the build process to generate corresponding binary artifacts.
	 ```
	 cd ${IOTFSADAPTER}/onvif
	 ./buildall.sh
	 ```

### Run

1. Start ONVIF-Thrift Server. This server will discover the IP cameras which conform with ONVIF standard, and collect those informations like rtsp url to host in itself.
	 ```
	 cd ${IOTFSADAPTER}/onvif/deps/nodenvc
	 node ./onvif
	 ```

2. Start ONVIF-OIC Server. This server will connect to ONVIF-Thrift server to retrieve IP camera information, and create OIC resource correspondingly.
	 ```
	 cd ${IOTFSADAPTER}/onvif/bin
	 ./onvif_oic_server
	 ```	 
	 

## Contributors
   | Name       | Email                     | Github id    |
	 |------------|---------------------------|--------------|
	 | Tianyou Li | <tianyou.li@gmail.com>    | TianyouLi    |
	 |            |                           |              |


