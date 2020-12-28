# DevOps Challenge


## Estructura de carpetas

- `app/` esta la aplicacion de "users" 
- `deploy/` todos los archivos de infraestructura y despliegue
- `test/`estan las pruebas de carga con jmeter y la coleccion de postman 

Se usara `make` para todos los comandos de ejecucion docker, test, deploy 


## Deploy cloud con ECS
> Por cuestiones económicas estoy desplegando el challenge en este servicio se que la prueba es con EKS

Para la infraestructura cloud se trabajó con bash script y jq para poder interactuar con AWS CLI en la carpeta `deploy/ecs`

Para el despliegue se usó Azure Devops 

**NOTA:** Las evidencias de herramientas que no se podran vern en el repo estan en la carpeta `screenshots/`

## Test jmeter

Para poder ejecutar los tests primero se necesita ejecutar el comando `./build.sh` para que puedas construir las depedencias de jmeter.

Luego se debe ejecutar `./test.sh` esto internamente ejecuta un test plan de jmeter y genera un directorio de reporte como output.

**NOTA2** para ver el reporte generado ir a `test/jmeter/tests/trivial/report.zip`



