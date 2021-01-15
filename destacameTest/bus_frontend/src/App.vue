<template>
  <div id="app" class="d-flex flex-column min-vh-100"> 
    
      <!-- Header -->
      <app-header></app-header>

      <!-- Body -->
      <b-container>
        <router-view/>
      </b-container>

      <!-- Footer -->
      <app-footer></app-footer>

  </div>
</template>

<script>
import AppFooter from './components/AppFooter.vue';
import AppHeader from './components/AppHeader.vue';
export default {
  components: {
    AppFooter,
    AppHeader
  }
  
}
</script>
<style lang="scss">

@import url("https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700&amp;display=swap");
@import "./assets/styles/base.scss";

</style>
