 <template>
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
</template>

<script>
export default {
  name: 'AppFooter',
  data () {
    return {

    }
  }
}
</script>