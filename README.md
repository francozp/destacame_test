# Destacame Test
## Description
Test para postulación a Destacame en el cargo de Full Stack Developer

## Setup
### Instalación de python 3.9.1
1. El primer paso es instalar Python 3.9.1. Para hacer esto, dirijase a esta página <https://www.python.org/downloads/release/python-391/> y descargue el archivo que corresponda a las especificiaciones de su sistema.
2. Siga las instrucciones en pantalla para llevar a cabo la instalación. Recuerde marca la casilla de agregar python al PATH.
### Creación del entorno virtual
Python 3 en adelante trae incorporando un paquete llamado venv que permite gestionar entornos virtuales. Para el desarrollo de esta prueba y su futura evaluación se recomienda la utilización del mismo. Para hacer esto se deben ejecutar los siguientes comandos:
1. python -m venv <nombre-del-directorio>, donde el nombre-del-directorio corresponde a la ubicación donde será creado el entorno virtual.
2. Para activar el entorno virtual, dirigirse al directorio del entorno virtual (por consola) e ingresar <.\Scripts\activate>
### Instalación de librerías de python
1. Abrir un terminal (Command prompt en Windows)
2. Dirigirse al directorio donde se ecncuentra el archivo "requirements.txt".
3. Instalar las librerías necesarias utilizando <pip install -r requirements.txt> en el terminal.
### Instalación de Vue.js
1. Para obtener vue, en primer lugar se debe instalar el Node.js y NPM. Para esto, se puede descargar desde <https://nodejs.org/en/download/>
2. Seguir las instrucciones en pantalla y realizar la instalación.
3. Luego para instalar vue, en consola ingresar <npm install -g @vue/cli>.
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