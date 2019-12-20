FROM library/alpine:latest

RUN apk update && apk add dovecot dovecot-mysql dovecot-sql dovecot-lmtpd dovecot-pop3d libsasl mysql-client shadow

RUN groupadd -g 5000 vmail
RUN useradd -g vmail -u 5000 -d /var/spool/mail vmail
RUN groupadd -g 4000 postfix
RUN useradd -g postfix -u 4000 -d /var/spool/postfix postfix

ENTRYPOINT /usr/sbin/dovecot -F -c /etc/dovecot/dovecot.conf
