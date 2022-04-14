build login theme
npm ci
npm run login

build docker image for test
docker build -t newsolid/keycloak .
docker container run -d --name keycloak -p 10001:8080 --mount type=bind,source=/mnt/c/react/keycloak_theme/theme,target=/opt/jboss/keycloak/themes/metronic  -e KEYCLOAK_USER=admin   -e KEYCLOAK_PASSWORD=admin  newsolid/keycloak
