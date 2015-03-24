FROM java:8
MAINTAINER neolao <contact@neolao.com>

COPY jaikoz_install.jar jaikoz_install.jar
COPY answers.txt answers.txt

RUN java -jar jaikoz_install.jar < answers.txt

CMD ["/usr/local/Jaikoz/jaikoz.sh"]
