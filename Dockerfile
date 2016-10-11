FROM alpine

MAINTAINER wufu cc <ccwufu@gmail.com>

RUN apk --no-cache add bash openssh \
  && mkdir -p ~root/.ssh \
  && chmod 700 ~root/.ssh \
  && echo -e "Port 443\n" >> /etc/ssh/sshd_config

EXPOSE 443

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 755 /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/usr/sbin/sshd", "-D", "-f", "/etc/ssh/sshd_config"]
