<template>
<div id="top-navbar">
    <b-navbar sticky toggleable="lg" type="light" variant="navbar-custom">
        <b-navbar-brand to="/">
          <img src="@/assets/images/navbar-logo.svg" style="height: 35px;margin: 5px;" class="d-inline-block align-top" alt="Destacame Buses">
        </b-navbar-brand>
        <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>
        <b-collapse id="nav-collapse" is-nav class="ml-auto">
            <b-navbar-nav class="navbar-light">
              <b-link class="nav-link" to="/" exact>Buscar Viajes</b-link>
              <b-link class="nav-link" to="/trips" exact>Crear Viaje</b-link>
              <b-link class="nav-link" to="/statistics" exact>Estadísticas</b-link>
              <b-nav-item-dropdown text="Administrar">
                  <b-dropdown-item class="nav-link" to="/buses" exact>Buses</b-dropdown-item>
                  <b-dropdown-item class="nav-link" to="/pasajeros" exact>Pasajeros</b-dropdown-item> 
                  <b-dropdown-item class="nav-link" to="/trayectos" exact>Trayectos</b-dropdown-item>
                  <b-dropdown-item class="nav-link" to="/choferes" exact>Choferes</b-dropdown-item>
              </b-nav-item-dropdown>
            </b-navbar-nav>
        </b-collapse>
    </b-navbar>
</div>
</template>

<script>
export default {
  name: 'AppHeader',
  data () {
    return {

    }
  }
}
</script>

<style lang="scss">

@import "@/assets/styles/header.scss";

</style>