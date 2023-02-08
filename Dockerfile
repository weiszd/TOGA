FROM continuumio/miniconda3
LABEL MAINTAINER="weisz@bcm.edu"
LABEL version="1.0"

RUN conda config --set always_yes yes --set changeps1 no && \
    conda update -q conda && \
    conda init bash && \
    conda install -c bioconda nextflow && \
    apt-get update && apt-get -y upgrade && \
    apt-get -y install --no-install-recommends git cmake build-essential wget rsync mc gawk curl && \ 
    apt-get clean && \
    apt-get purge && \
    git clone https://github.com/hillerlab/TOGA.git /TOGA && \
    cd /TOGA && python3 -m pip install -r requirements.txt && \
    ./configure.sh \
    #&& ./run_test.sh micro