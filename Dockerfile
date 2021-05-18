FROM alpine:3.7

RUN \
# apk add installs the following
 apk add \
   curl \
   python \
   py-pip \
   py-boto \
   py-dateutil \
   py-httplib2 \
   py-jinja2 \
   py-paramiko \
   py-setuptools \
   py-yaml \
   openssh-client \
   bash \
   tar && \
 pip install --upgrade pip && \
 pip install ansible==2.7.5 awscli boto boto3 && \
 mkdir -p /ansible/playbooks && \
 curl -o /usr/local/bin/jp -L https://github.com/jmespath/jp/releases/download/0.1.3/jp-linux-amd64 && \
 chmod +x /usr/local/bin/jp

# Makes the playbooks directory the working directory
WORKDIR /ansible/playbooks

# Sets environment variables
ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_HOST_KEY_CHECKING False
ENV ANSIBLE_RETRY_FILES_ENABLED False
ENV ANSIBLE_ROLES_PATH /ansible/playbooks/roles
ENV ANSIBLE_SSH_PIPELINING True
#ENV PATH /ansible/bin:$PATH
#ENV PYTHONPATH /ansible/lib
