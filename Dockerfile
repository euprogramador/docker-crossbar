FROM centos:7

RUN rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm

RUN yum install -y libffi-devel python-pip gcc openssl-devel python-devel
RUN pip install virtualenv
RUN virtualenv python-venv

WORKDIR /python-venv
RUN . bin/activate

RUN pip install crossbar[all]
RUN crossbar version


# compatibility fix for node on ubuntu
RUN ln -s /usr/bin/nodejs /usr/bin/node;

# install nvm
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.24.1/install.sh | sh;

# invoke nvm to install node
RUN cp -f ~/.nvm/nvm.sh ~/.nvm/nvm-tmp.sh; \
    echo "nvm install 0.12.6; nvm alias default 0.12.6" >> ~/.nvm/nvm-tmp.sh; \
    sh ~/.nvm/nvm-tmp.sh; \
    rm ~/.nvm/nvm-tmp.sh;
