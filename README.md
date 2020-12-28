# DevOps Challenge


## Estructura de carpetas

- `app/` esta la aplicacion de "users" 
- `deploy/` todos los archivos de infraestructura y despliegue
- `test/`estan las pruebas de carga con jmeter y la coleccion de postman 

Se usara `make` para todos los comandos de ejecucion docker, test, deploy 


## Deploy cloud con ECS
> Por cuestiones económicas estoy desplegando el challenge en este servicio se que la prueba es con EKS

Se trabajó con bash script y jq para poder interactuar con AWS CLI en la carpeta `deploy/ecs`

