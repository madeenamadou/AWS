#!/bin/sh
#  scripts.sh
#  
#
#  Created by Youssef de Madeen on 17-06-03.
#

##################################################
# create aws account
# start ec2 instance
# configure IAM role cwith permission to write to Amazon Kinesis Firehose and Amazon CloudWatch
# connect via ssh to ec2 instance
chmod 400 ~/Dropbox/aws/key002.pem
ssh -i "Dropbox/aws/key002.pem" ec2-user@ec2-54-234-146-30.compute-1.amazonaws.com
# prepare log file

##create fake logs
sudo su
yum update && \
yum install -y nano git aws-kinesis-agent && \
#sudo yum install python-pip
sudo easy_install pip && \
pip install pytz numpy faker tzlocal awscli && \
#git clone http://github.com/madeenamadou/Fake-Apache-Log-Generator && \
yum install –y https://s3.amazonaws.com/streaming-data-agent/aws-kinesis-agent-latest.amzn1.noarch.rpm


#aws configure
touch -f /root/.aws/config && \
touch -f /root/.aws/credentials
aws_id=AKIAIEXJLIHTGANS5LFQ && \
aws_key=lfK5LYPUu7yAZepRMDLB4iZxHeE1Z3L3Zfh1baFW && \
shopt -s xpg_echo && \
echo "[default]\noutput = json\nregion = ca-central-1" > /root/.aws/config && \
echo "aws_access_key_id = ${aws_id}\naws_secret_access_key = ${aws_key}" > /root/.aws/credentials && \
chmod +rwx -R /root/.aws/

#sudo nano /etc/sysconfig/aws-kinesis-agent
sed -i "/[^#]*AWS_ACCESS_KEY_ID*/ s/..//" /etc/sysconfig/aws-kinesis-agent
sed -i "/[^#]*AWS_SECRET_ACCESS_KEY*/ s/..//" /etc/sysconfig/aws-kinesis-agent
sed -i "/[^#]*AWS_DEFAULT_REGION*/ s/..//" /etc/sysconfig/aws-kinesis-agent
sed -i "/^AWS_ACCESS_KEY_ID*/ s/$/${aws_id}/" /etc/sysconfig/aws-kinesis-agent
sed -i "/^AWS_SECRET_ACCESS_KEY*/ s/$/${aws_key}/" /etc/sysconfig/aws-kinesis-agent
sed -i "/^AWS_DEFAULT_REGION*/ s/$/us-east-1/" /etc/sysconfig/aws-kinesis-agent
aws_id= && \
aws_key=

nano /etc/aws-kinesis/agent.json
#Add permission for the Amazon Kinesis agent user to access logs, using the following command
sudo setfacl -m u:aws-kinesis-agent-user:rwx /tmp
service aws-kinesis-agent start

chmod +rwx -R ~/tmp/
cd / && \
cd /tmp/
python /Fake-Apache-Log-Generator/apache-fake-log-gen.py -n 0 -o LOG -p WEB1











######################


rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm && \
yum install -y python-pip && \
pip install --upgrade pip
pip install pytz numpy faker tzlocal awscli googlefinance

##get root permissions
sudo su
passwd root #create root password
##enter root
pip install pytz numpy faker tzlocal awscli
# leave root exit
git clone http://github.com/madeenamadou/Fake-Apache-Log-Generator
python Fake-Apache-Log-Generator/apache-fake-log-gen.py -n 100 -o LOG -p WEB1
python ~/Fake-Apache-Log-Generator/apache-fake-log-gen.py -n 0 -o LOG

#create firehose delivery streams to send logs to s3 and kinesis analytics

#configure ec2 to send the data using the Amazon Kinesis Agent
##Amazon Kinesis Agent
sudo yum install –y aws-kinesis-agent
yum install –y https://s3.amazonaws.com/streaming-data-agent/aws-kinesis-agent-latest.amzn1.noarch.rpm

git clone http://github.com/awslabs/amazon-kinesis-agent
cd amazon-kinesis-agent && sudo ./setup --install

##enter root
## change filePattern: "/WEB1*.log",
## change kinesisStream: "web-log-ingestion-stream"
## change deliveryStream: "ec2_logs_delivery"
## change kinesis.endpoint & firehose.endpoint if region differs from us-east-1
#{
#"cloudwatch.endpoint": "monitoring.us-east-1.amazonaws.com",
#"cloudwatch.emitMetrics": true,
#"firehose.endpoint": "firehose.us-east-1.amazonaws.com",
#"flows": [
#{
#"filePattern": "full-path-to-log-file",
#"deliveryStream": "name-of-delivery-stream",
#"dataProcessingOptions": [
#{
#"initialPostion": "START_OF_FILE",
#"maxBufferAgeMillis":"2000",
#"optionName": "LOGTOJSON",
#"logFormat": "COMBINEDAPACHELOG"
#"delimiter": "\\t"
"customFieldNames": ["host", "ident", "authuser", "datetime", "request", "response"]
#}]
#}
#]
#}

[Index,LastTradeWithCurrency,LastTradeDateTime,LastTradePrice,LastTradeTime,LastTradeDateTimeLong,StockSymbol,ID]


#csv

"initialPostion": "START_OF_FILE",
"maxBufferAgeMillis":"2000",
"optionName": "CSVTOJSON",
"customFieldNames": ["Index","LastTradeWithCurrency","LastTradeDateTime","LastTradePrice","LastTradeTime","LastTradeDateTimeLong","StockSymbol","ID"],
"delimiter": "\t"


["Index","LastTradeWithCurrency","LastTradeDateTime","LastTradePrice","Yield","LastTradeTime","LastTradeDateTimeLong","Dividend","StockSymbol","ID"]


#sql app
CREATE OR REPLACE STREAM "DESTINATION_SQL_STREAM" (datetime VARCHAR(30),status INTEGER,statusCount INTEGER);
CREATE OR REPLACE PUMP "STREAM_PUMP" AS INSERT INTO "DESTINATION_SQL_STREAM"
SELECT STREAM TIMESTAMP_TO_CHAR('yyyy-MM-dd HH:mm:ss.SSS',LOCALTIMESTAMP) as datetime,"response" as status, COUNT(*) AS statusCount

FROM "SOURCE_SQL_STREAM_001"
GROUP BY "response", FLOOR(("SOURCE_SQL_STREAM_001".ROWTIME - TIMESTAMP '1970-01-01 00:00:00') minute / 1 TO MINUTE);


if [ -f /home/ec2-user/.bashrc ]; then
		echo "alias cl=\'clear\'" >> /home/ec2-user/.bashrc
		echo "export PATH=$PATH:\/usr\/local\/bin\/" >> /home/ec2-user/.bashrc
fi

nano /etc/aws-kinesis/agent.json
nano /etc/sysconfig/aws-kinesis-agent

nano /amazon-kinesis-agent/configuration/example/agent.json

sudo service aws-kinesis-agent start

#Create an Amazon Elasticsearch Service Domain

#create firehose delivery streams to send aggregated data to elastic search


#Create an Amazon Kinesis Analytics Application



##google finance live quotes
pip install googlefinance



##########################################################
#!/usr/bin/python
#!/usr/bin/python
from googlefinance import getQuotes
import json
import random
import sys
import time
import re

def main():
        with open("WEB1_quotes_.log", "w") as file:
                for i in range(int(sys.argv[1])):
                        time.sleep(1)
                        a = str(getQuotes('AAPL'))
                        b = re.findall(":\su'[\w\s\d\.\:\,]+", str(a), flags=0)
                        c = re.findall("'[\w\d\s\:\.\,]+", str(b), flags=0)
                        d = re.sub("['\[\]]", "", str(c))
                        e = re.sub("\"", "'", str(d))
                        e = re.sub("^'|'$","",e)
                        e = re.split("',\s'",str(e))
                        file.write('\t'.join(e) + "\n")
                        #file.write(str(random.random()) + "\n")

if __name__ == "__main__":
        main()

print json.dumps(getQuotes('AAPL'), indent=2)

##copy over ssh
scp -i "key002.pem" test.py ec2-user@ec2-54-86-66-172.compute-1.amazonaws.com:

##python
import re

a = str(getQuotes('AAPL'))
b = re.findall(":\su'[\w\s\d\.\:\,\-]+", str(a), flags=0)
c = re.findall("'[\w\d\s\:\.\,\-]+", str(b), flags=0)
d = re.sub("['\[\]]", "", str(c))
e = re.split(",\s",str(d))
"\t".join(e)


re.split(pattern, string, maxsplit=0, flags=0)


##R
str_extract_all(a,"u[\'[A-Za-z]\']++:[:space:]u[\'[a-zA-Z0-9]\']++")
str_extract_all(a,":[:space:]u'[a-zA-Z0-9:.,[:space:]]++'")
b = str_extract_all(a,":[:space:]u'[a-zA-Z0-9:.,[:space:]]++'")
c = str_extract_all(b,"'[a-zA-Z0-9:.,[:space:]]++'")
d = str_replace_all(unlist(c),"'","")




[
  {
    "Index": "NYSE",
    "LastTradeWithCurrency": "8.40",
    "LastTradeDateTime": "2017-06-07T12:52:03Z",
    "LastTradePrice": "8.40",
    "LastTradeTime": "12:52PM EDT",
    "LastTradeDateTimeLong": "Jun 7, 12:52PM EDT",
    "StockSymbol": "BBD",
    "ID": "675597"
  }
]

with open('data.txt', 'w') as outfile:
    json.dump(getQuotes('AAPL'), outfile)

import json
with open('data.txt', 'w') as f:
	quote = json.dumps(getQuotes('AAPL'), indent=2)


with open('data.txt') as quotes_file:
    data = json.load(quotes_file)

print(data)
















############elastic beanstalk

git clone https://github.com/awslabs/aws-nodejs-sample.git
cd aws-nodejs-sample
npm install








