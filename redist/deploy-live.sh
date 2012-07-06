#scp -i ~/groupm-live.pem cep_lib/*.* ubuntu@ec2-176-34-90-184.eu-west-1.compute.amazonaws.com:apps/mambalab-live/cep_lib
scp -i ~/groupm-live.pem *.jar ubuntu@ec2-176-34-90-184.eu-west-1.compute.amazonaws.com:apps/mambalab-live
scp -i ~/groupm-live.pem config/*.* ubuntu@ec2-176-34-90-184.eu-west-1.compute.amazonaws.com:apps/mambalab-live/config
scp -i ~/groupm-live.pem rules/*.* ubuntu@ec2-176-34-90-184.eu-west-1.compute.amazonaws.com:apps/mambalab-live/rules
scp -i ~/groupm-live.pem groupm-live.sh ubuntu@ec2-176-34-90-184.eu-west-1.compute.amazonaws.com:apps/mambalab-live/start.sh
