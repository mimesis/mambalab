#scp -i ~/groupm-live.pem cep_lib/*.* ubuntu@46.51.130.32:apps/mambalab/cep_lib
scp -i ~/groupm-live.pem *.* ubuntu@46.51.130.32:apps/mambalab
scp -i ~/groupm-live.pem config/*.* ubuntu@46.51.130.32:apps/mambalab/config
scp -i ~/groupm-live.pem rules/*.* ubuntu@46.51.130.32:apps/mambalab/rules