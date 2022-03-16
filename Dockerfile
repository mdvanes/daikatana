FROM nginx

RUN apt update && apt -y install openssh-server

RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

# Allow access to forwarded ports
RUN echo "GatewayPorts yes" >> /etc/ssh/sshd_config

# Set root password to "daikatana"
RUN echo root:daikatana | chpasswd

RUN /etc/init.d/ssh start

COPY public /usr/share/nginx/html

# CMD ["/usr/sbin/sshd", "-D"]