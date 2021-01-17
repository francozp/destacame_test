 <template>
 <footer class="mt-auto">
    <b-container fluid style="padding-bottom: 0px;background-color:#31395b">
        <b-row>
        <b-col class="footer-col">
            <img src="@/assets/images/footer-logo.svg" style="height: 30px;margin: 10px;" class="d-inline-block align-top" alt="Destacame Buses"></b-col>
        <b-col class="footer-col">
            <ul style="padding-inline-start: 180px; text-align:left;list-style:none">
            <li>Destacame Buses</li>
            <li><router-link class="footer-link" to="/">Reserva de Asientos</router-link></li>
            <li><router-link class="footer-link" to="/trips">Crear Viaje</router-link></li>
            <li><router-link class="footer-link" to="/about">Estadísticas</router-link></li>
            </ul>
        </b-col>
        <b-col class="footer-col">
            <ul style="padding-inline-start: 180px; text-align:left;list-style:none">
            <li>Administrar</li>
            <li><router-link class="footer-link" to="/buses">Buses</router-link></li>
            <li><router-link class="footer-link" to="/pasajeros">Pasajeros</router-link></li>
            <li><router-link class="footer-link" to="/trayectos">Trayectos</router-link></li>
            <li><router-link class="footer-link" to="/choferes">Choferes</router-link></li>
            </ul>
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

<style lang="scss">

@import "@/assets/styles/footer.scss";

</style>