# Destacame Test
## Descripción
Test para postulación a Destacame en el cargo de Full Stack Developer el cual consiste en una plataforma para gestionar los viajes de una agencia de buses.

## Configuración
A continuación se explicarán los pasos a seguir para hacer funcionar el proyecto.
### Instalación de python 3.9.1
1. El primer paso es instalar Python 3.9.1. Para hacer esto, dirijase a esta página <https://www.python.org/downloads/release/python-391/> y descargue el archivo que corresponda a las especificaciones de su sistema.
2. Siga las instrucciones en pantalla para llevar a cabo la instalación. Recuerde marcar la casilla de agregar python al PATH de su sistema.
### Creación del entorno virtual
Python 3 en adelante trae incorporando un paquete llamado venv que permite gestionar entornos virtuales. Para el desarrollo de esta prueba y su futura evaluación se recomienda la utilización del mismo. Para hacer esto se deben ejecutar los siguientes comandos:
1. python -m venv <nombre-del-directorio>, donde el nombre-del-directorio corresponde a la ubicación donde será creado el entorno virtual.
2. Para activar el entorno virtual, dirigirse al directorio del entorno virtual (por consola) e ingresar <.\Scripts\activate>
### Instalación de librerías de python
1. Abrir un terminal (Command prompt en Windows)
2. Activar el entorno virtual creado.
2. Dirigirse al directorio donde se encuentra el archivo "requirements.txt".
3. Instalar las librerías necesarias utilizando <pip install -r requirements.txt> en el terminal.
### Instalación de Vue.js
1. Para obtener vue, en primer lugar se debe instalar Node.js/NPM. Para esto, se puede descargar desde <https://nodejs.org/en/download/>
2. Seguir las instrucciones en pantalla y realizar la instalación.
3. Luego para instalar vue, en consola ingresar <npm install -g @vue/cli>.
  
### Instalación de XAMPP
La base de datos utilizado en este proyecto corresponde a MySql. XAMPP es utilizado para crear un servidor local donde se encuentre la base de datos creada. 
1. Descargar XAMPP desde https://www.apachefriends.org/es/download.html
2. Instalar siguiendo instrucciones en pantalla.
3. Una vez instalado, abrir XAMPP e iniciar los servicios de Apache y MySQL.
4. Cuando esten los servicios en verde, presionar el boton "Admin" ubicado en el servicio de MySQL.
5. Se debería abrir una pagina: PhpMyAdmin
6. Dentro de esta pagina, crear una base de datos nueva llamada 'destacame_test'
7. Seleccionar la base de datos creada y luego seleccionar la opción "import". Luego presionar "Browse your computer" y buscar el archivo .sql incluido en el proyecto 'destacame_test.sql'.
8. Presionar el botón GO.
9. Ahora la base de datos está lista :)

## ¿Cómo iniciar el proyecto Destacame Buses?
Para iniciar el proyecto se deben seguir lo siguientes pasos.
1. Abrir XAMPP e iniciar los servicios de MySQL y Apache.
2. Abrir dos terminales.
3. En un terminal, activar el entorno virtual creado y luego dirigirse (en consola) a la carpeta raiz del proyecto (donde se encuentra manage.py). Una vez en el directorio, ejecutar el comando <python manage.py runserver>. En caso de que falle, pueden probar reemplazando 'python' por 'py' o 'python3'.
4. En el otro terminal, dirigirse a la carpeta raiz antes mencionada y luego a la carpeta 'bus_frontend'. Una vez allí, ejecutar el comando <npm run serve>.
5. Ahora que está Django y Vue.js andando, dirigirse en algún browser al sitio http://localhost:8080/.
6. Listo :)
  
## ¿Cómo utilizarlo?
En el sistema se han implementado todas las funciones requeridas. Para esto se han creado varias vistas. En la barra de navegación pueden ver 4 campos.
  1. Buscar Viajes: En esta vista se pueden buscar viajes para un pasajero, de tal forma que este pueda reservar un asiento para un viaje en particular.
## Apunte, luego borrar 
### Orden de comandos ejecutados para instalar librerías
1. pip install django
npm install axios (para conectar con el backend)
npm install bootstrap bootstrap-vue jquery popper.js (framework css, antes bulma)

db_admin = admin pw destacametest
la aplicacion de vue tiene babel, router y css preprocessors = Sass/SCSS (with node-sass)

npm i --save @fortawesome/fontawesome-svg-core
npm i --save @fortawesome/free-solid-svg-icons
npm i --save @fortawesome/vue-fontawesome
