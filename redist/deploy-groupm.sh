#scp -i ~/groupm-live.pem cep_lib/*.* ubuntu@ec2-176-34-90-184.eu-west-1.compute.amazonaws.com:apps/mambalab-groupm/cep_lib
scp -i ~/groupm-live.pem *.jar ubuntu@ec2-176-34-90-184.eu-west-1.compute.amazonaws.com:apps/mambalab-groupm
scp -i ~/groupm-live.pem config/*.* ubuntu@ec2-176-34-90-184.eu-west-1.compute.amazonaws.com:apps/mambalab-groupm/config
scp -i ~/groupm-live.pem rules/*.* ubuntu@ec2-176-34-90-184.eu-west-1.compute.amazonaws.com:apps/mambalab-groupm/rules
scp -i ~/groupm-live.pem groupm-groupm.sh ubuntu@ec2-176-34-90-184.eu-west-1.compute.amazonaws.com:apps/mambalab-groupm/start.sh
