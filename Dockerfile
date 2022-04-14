FROM jboss/keycloak:latest

ADD ./standalone-ha.xml /opt/jboss/keycloak/standalone/configuration/standalone-ha.xml