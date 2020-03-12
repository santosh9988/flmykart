from ubuntu
RUN sudo apt-get update -y
RUN sudo apt install software-properties-common -y
RUN sudo add-apt-repository ppa:deadsnakes/ppa -y
RUN sudo apt install python3.7 -y
RUN sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py -y
RUN sudo apt install python3-pip -y
RUN sudo python3.7 get-pip.py
ENV AWS_DEFAULT_REGION='[default region]'
ENV AWS_ACCESS_KEY_ID='[access key id]'
ENV AWS_SECRET_ACCESS_KEY='[secret key]'
RUN pip install awscli
