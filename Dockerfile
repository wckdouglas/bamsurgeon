FROM continuumio/miniconda:latest

ENV PATH /opt/conda/bin:$PATH
RUN mkdir /usr/share/man/man1 && apt update && apt install -y default-jre


RUN conda config --add channels defaults && \
    conda config --add channels bioconda && \
    conda config --add channels conda-forge && \
    conda install python=3.6 && \
    conda install -c conda-forge mamba

RUN mamba install bwa bcftools samtools numpy scipy velvet exonerate
RUN git clone https://github.com/adamewing/bamsurgeon.git && \
    cd bamsurgeon && \
    python setup.py install

CMD []
