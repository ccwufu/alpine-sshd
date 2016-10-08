
FROM alpine
MAINTAINER wufu cc ccwufu@gmail.com

# add openssh and clean
RUN apk --no-cache add openssh

# add entrypoint script
ADD docker-entrypoint.sh /usr/sbin
#make sure we get fresh keys
RUN rm -rf /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key

EXPOSE 22
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/sbin/sshd","-D"]