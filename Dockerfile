FROM nginx:stable-alpine

# 기본 Nginx 설정 파일 제거
RUN rm -f /etc/nginx/conf.d/default.conf

# 설정 파일 복사
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY sites/ /etc/nginx/conf.d/

# 인증서 디렉토리
VOLUME ["/etc/nginx/certs"]
# 로그 디렉토리
VOLUME ["/var/log/nginx"]
# 웹 콘텐츠 디렉토리
VOLUME ["/usr/share/nginx/html"]

# 포트 노출
EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
