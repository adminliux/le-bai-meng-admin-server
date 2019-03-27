FROM tomcat
ARG WEBAPPS=/usr/local/tomcat/webapps
ARG ROOT=${WEBAPPS}/ROOT
ARG DEPENDENCY=
RUN mv ${ROOT} ${WEBAPPS}/main
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
COPY ${DEPENDENCY}/meng-admin-1.0 ${ROOT}
