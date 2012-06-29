#scp -i ~/reporting-dev.pem cep_lib/*.* mimesis@brm2.mimesis-republic.net:apps/mambalab/cep_lib
scp -i ~/reporting-dev.pem *.* mimesis@brm2.mimesis-republic.net:apps/mambalab
scp -i ~/reporting-dev.pem config/*.* mimesis@brm2.mimesis-republic.net:apps/mambalab/config
scp -i ~/reporting-dev.pem rules/*.* mimesis@brm2.mimesis-republic.net:apps/mambalab/rules