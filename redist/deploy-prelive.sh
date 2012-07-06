#scp -i ~/groupm-live.pem cep_lib/*.* ubuntu@ec2-176-34-90-184.eu-west-1.compute.amazonaws.com:apps/mambalab-prelive/cep_lib
scp -i ~/groupm-live.pem *.jar ubuntu@ec2-176-34-90-184.eu-west-1.compute.amazonaws.com:apps/mambalab-prelive
scp -i ~/groupm-live.pem config/*.* ubuntu@ec2-176-34-90-184.eu-west-1.compute.amazonaws.com:apps/mambalab-prelive/config
scp -i ~/groupm-live.pem rules/*.* ubuntu@ec2-176-34-90-184.eu-west-1.compute.amazonaws.com:apps/mambalab-prelive/rules
scp -i ~/groupm-live.pem groupm-prelive.sh ubuntu@ec2-176-34-90-184.eu-west-1.compute.amazonaws.com:apps/mambalab-prelive/start.sh
