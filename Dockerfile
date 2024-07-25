FROM mysql:8.0

# Cấp quyền cho thư mục MySQL
RUN chown -R mysql:root /var/lib/mysql/

# Đặt các biến môi trường cho MySQL
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

ENV MYSQL_DATABASE=$MYSQL_DATABASE
ENV MYSQL_USER=$MYSQL_USER
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD

# Thêm tệp SQL vào container
ADD pro1041.sql /etc/mysql/pro1041.sql

# Thay thế MYSQL_DATABASE trong tệp SQL
RUN sed -i 's/MYSQL_DATABASE/'"$MYSQL_DATABASE"'/g' /etc/mysql/pro1041.sql

# Thêm tệp cấu hình để cho phép kết nối từ xa
COPY my.cnf /etc/mysql/my.cnf

# Tạo thư mục initdb và sao chép tệp SQL vào đó
RUN mkdir -p /docker-entrypoint-initdb.d
RUN cp /etc/mysql/pro1041.sql /docker-entrypoint-initdb.d/

# Mở cổng 3306 cho MySQL
EXPOSE 3306
