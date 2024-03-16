FROM quay.io/keycloak/keycloak:latest as builder
ENV KEYCLOAK_ADMIN='username'
ENV KEYCLOAK_ADMIN_PASSWORD='password'
ADD --chown=keycloak:keycloak keycloak-2fa-email-authenticator.jar /opt/keycloak/providers/keycloak-2fa-email-authenticator.jar
COPY ./themes/my-theme/ /opt/keycloak/themes/my-theme
RUN /opt/keycloak/bin/kc.sh build
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
