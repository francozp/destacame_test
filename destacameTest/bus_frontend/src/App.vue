<template>
  <div id="app" class="d-flex flex-column min-vh-100"> 
      <!-- Navbar -->
      <div id="top-navbar">
        <b-navbar sticky="True" toggleable="lg" type="light" variant="navbar-custom">
          <b-navbar-brand href="#">
            <img src="@/assets/images/logo.jpg" style="height: 30px;margin: 5px;" class="d-inline-block align-top" alt="Destacame Buses">
          </b-navbar-brand>
          <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>
            <b-collapse id="nav-collapse" is-nav class="ml-auto">
              <b-navbar-nav class="navbar-light">
                <b-link class="nav-link" to="/" exact>Viaje</b-link>
                <b-link class="nav-link" to="/about" exact>Estadísticas</b-link>
                <b-nav-item-dropdown text="Administrar">
                  <b-link class="nav-link" exact>Buses</b-link>
                  <b-link class="nav-link" exact>Pasajeros</b-link> 
                  <b-link class="nav-link" exact>Trayectos</b-link>
                  <b-link class="nav-link" exact>Choferes</b-link>
                  <b-link class="nav-link" exact>Viajes</b-link>
                </b-nav-item-dropdown>
              </b-navbar-nav>
            </b-collapse>
        </b-navbar>
      </div>
      <!-- Body-->
          
      <b-jumbotron>
        <router-view/>
      </b-jumbotron>


      <footer class="mt-auto">
        <b-container fluid style="padding-bottom: 0px;background-color:#31395b">
          <b-row>
            <b-col>
              <img src="@/assets/images/logo.jpg" style="height: 20px;margin: 5px;" class="d-inline-block align-top" alt="Destacame Buses"></b-col>
            <b-col>
              <ul style="padding-inline-start: 180px; text-align:left;list-style:none">
                <li>Destacame Buses</li>
                <li><router-link to="/">Buses</router-link></li>
                <li><router-link to="/about">Pasajeros</router-link></li>
                <li><router-link to="/">Trayectos</router-link></li>
                <li><router-link to="/about">Choferes</router-link></li>
                <li><router-link to="/">Viajes</router-link></li>
              </ul>
            </b-col>
            <b-col  >
              <ul style="padding-inline-start: 180px; text-align:left;list-style:none">
                <li>Administrar</li>
                <li><router-link to="/">Viajes</router-link></li>
                <li><router-link to="/about">Estadísticas</router-link></li>
              </ul>
            </b-col>
            <b-col>
              Redes Sociales
            </b-col>
          </b-row>
        </b-container>
      </footer>
  </div>
</template>

<style lang="scss">

@import url("https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700&amp;display=swap");
@import "./assets/styles/base.scss";

#app {
  font-family: "Source Sans Pro";
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

ul li a{
  color: white !important; 
  opacity: .7;
  line-height: 2.3;
  font-size: 14px !important;
}

ul li{
  color: white !important;
}

</style>
