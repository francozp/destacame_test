# Destacame Test
## Descripción
Test para postulación a Destacame en el cargo de Full Stack Developer el cual consiste en una plataforma para gestionar los viajes de una agencia de buses.
## Modelo de datos
Se creo a partir de las necesidades planteadas en el enunciado. Destaco la creación de un campo "seats_taken" en el modelo "Viajes", el cual permite facilitar las consultas de estadisticas solicitadas. Si bien reconozco que existe un trade-off, ya que se ocupará un poco más de almacenamiento, creo que a gran escala podría resultar en un gran beneficio para el sistema. El modelo de datos es el siguiente:
## Configuración 🔧
A continuación se explicarán los pasos a seguir para hacer funcionar el proyecto.
### Instalación de python 3.9.1
1. El primer paso es instalar Python 3.9.1. Para hacer esto, dirijase a esta página <https://www.python.org/downloads/release/python-391/> y descargue el archivo que corresponda a las especificaciones de su sistema.
2. Siga las instrucciones en pantalla para llevar a cabo la instalación. Recuerde marcar la casilla de agregar python al PATH de su sistema.
### Creación del entorno virtual
Python 3 en adelante trae incorporado un paquete llamado venv que permite gestionar entornos virtuales. Para el desarrollo de esta prueba y su futura evaluación se recomienda la utilización del mismo. Para hacer esto se deben ejecutar los siguientes comandos:
1. Abrir terminal (como el Command prompt en Windows)
2. Escribir `python -m venv <nombre-del-directorio>`, donde el nombre-del-directorio corresponde a la ubicación donde será creado el entorno virtual.
3. Para activar el entorno virtual, dirigirse al directorio del entorno virtual (por consola) e ingresar `.\Scripts\activate`.
### Instalación de librerías de python
1. Abrir un terminal
2. Activar el entorno virtual creado.
3. Dirigirse al directorio donde se encuentra el archivo "requirements.txt". Esto está ubicado en la carpeta raiz del proyecto.
4. Instalar las librerías necesarias utilizando `pip install -r requirements.txt` en el terminal.
### Instalación de Vue.js
1. Para obtener vue, en primer lugar se debe instalar Node.js/NPM (versión LTS). Para esto, se puede descargar desde <https://nodejs.org/en/download/>
2. Seguir las instrucciones en pantalla y realizar la instalación.
3. Abrir un terminal y dirijirse al directorio raiz y luego a la carpeta 'bus_frontend'.
3. Luego para instalar vue, en consola ingresar `npm install -g @vue/cli`.
4. A continuación ejecutar `npm install axios` y luego `npm install bootstrap bootstrap-vue jquery popper.js`
  
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

## ¿Cómo iniciar el proyecto Destacame Buses? ⚙️
Para iniciar el proyecto se deben seguir lo siguientes pasos.
1. Abrir XAMPP e iniciar los servicios de MySQL y Apache.
2. Abrir dos terminales.
3. En un terminal, activar el entorno virtual creado y luego dirigirse (en consola) a la carpeta raiz del proyecto (donde se encuentra manage.py). Una vez en el directorio, ejecutar el comando `python manage.py runserver`. En caso de que falle, pueden probar reemplazando 'python' por 'py' o 'python3'.
4. En el otro terminal, dirigirse a la carpeta raiz antes mencionada y luego a la carpeta 'bus_frontend'. Una vez allí, ejecutar el comando `npm run serve`.
5. Ahora que está Django y Vue.js andando, dirigirse en algún browser al sitio http://localhost:8080/.
6. Listo :)
  
## ¿Cómo utilizarlo? 
En el sistema se han implementado todas las funciones requeridas. Para esto se han creado varias vistas. En la barra de navegación pueden ver 4 campos.
1. **Buscar Viajes:** En esta vista se pueden buscar viajes para un pasajero, de tal forma que este pueda reservar un asiento para un viaje en particular. Para buscar el viaje, se deben llenar los 4 campos solicitados. Rut del pasajero, el cual debe existir en la base de datos, la fecha, el origen y el destino. Una vez llenados los campos, se puede apretar el botón "Buscar Viajes". Trás presionarlo, se le redijirá a la vista de servicios.
	1. **Servicios:** En la vista de servicios aparecerán los servicios junto a sus horarios. Para seleccionar un asiento el algún servicio se debe presionar el botón "Ver Asientos" de ese servicio en particular. Esto abrirá un "pop-up" dentro del cual se mostrará la distribución de asientos del servicio seleccionado. Se podrá elegir un asiento que se encuentre disponible (azul claro, ver leyenda). Una vez seleccionado, presionar el botón "Reservar Asientos" y el asiento del pasajero será reservado.
2. **Crear Viaje:** En esta vista se pueden crear nuevos viajes. Para crear el viaje, se deben llenar todos los campos. Los viajes asocian los trayectos, con un bus, un chofer y un horario. En esta vista los datos son obtenidos desde la base de datos, por lo que si aparecen en el campo, es porque ya existe. Una vez seleccionados todos los campos, presione el botón "Crear Viaje" y el viaje será creado.
3. **Estadísticas:** En esta vista se pueden ver las "estadísticas". En primera instancia se listan los trayectos con su promedio de pasajeros. Luego, si se ingresa un valor entre 0 y 99 en el campo ubicado en la columna "Filtrar Buses" de algún trayecto y luego se presiona el botón filtrar, se mostrarán los buses de ese trayecto que tengan al menos ese porcentaje de su capacidad vendida.
4. **Administrar:** Aquí se pueden elegir 4 opciones. Buses, Pasajeros, Trayectos o Choferes. En estas vistas se podrán realizar todas las operaciones CRUD. Es decir, en cada una se podrán crear, leer, actualizar y eliminar objetos correspondientes al modelo correspondiente a cada vista. En la parte superior izquierda encontrará un botón azul "Crear <objeto>", que al presionarlo desplegará un "Pop-up" donde podrá crearse el objeto. Para esto se deben ingresar los datos solicitados y luego presionar en crear. Por otra parte, al extremo derecho de este botón "Crear <Objeto>" se encuentra un filtro para poder buscar en la tabla. En la tabla misma se muestran los datos almacenados en la base de datos junto a dos botones de acción. En primer lugar está el editar, que desplegará una pop-up similar al de creación, donde se podrán editar los datos del objeto. En segundo lugar está el botón eliminar, que al presionarlo llevara a cabo la eliminación del objeto. Por último, al final de la tabla se encuentran opciones de paginación.

## A mejorar
* Mejor manejo de formularios (validación)
* Verificar que los buses y choferes no estén siendo ocupados a cierto horario.
* Aprender más sobre Vue.js y Django Rest Framework.
## Autor ✒️
**Franco Rodolfo Zalavari Palma** - fzpalma@gmail.com

## Apunte, luego borrar 
### Orden de comandos ejecutados para instalar librerías
npm install axios (para conectar con el backend)
npm install bootstrap bootstrap-vue jquery popper.js (framework css, antes bulma)

db_admin = admin pw destacametest
la aplicacion de vue tiene babel, router y css preprocessors = Sass/SCSS (with node-sass)

npm i --save @fortawesome/fontawesome-svg-core
npm i --save @fortawesome/free-solid-svg-icons
npm i --save @fortawesome/vue-fontawesome
