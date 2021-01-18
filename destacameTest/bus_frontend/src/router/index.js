import Vue from 'vue'
import VueRouter from 'vue-router'

import Home from '../views/Home'
import Statistics from '../views/Statistics'
import Buses from '../views/Buses'
import Passengers from '../views/Passengers'
import Courses from '../views/Courses'
import Drivers from '../views/Drivers'
import Trips from '../views/Trips'
import Service from '../views/Service'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
    meta: {
      title: 'Destacame-Buses: Buscar Viaje',
    }
  },
  {
    path: '/statistics',
    name: 'Statistics',
    component: Statistics,
    meta: {
      title: 'Destacame-Buses: Estadísticas',
    }
  },
  {
    path: '/buses',
    name: 'Buses',
    component: Buses,
    meta: {
      title: 'Destacame-Buses: Buses',
    }
  },
  {
    path: '/pasajeros',
    name: 'Passengers',
    component: Passengers,
    meta: {
      title: 'Destacame-Buses: Pasajeros',
    }
  },
  {
    path: '/trayectos',
    name: 'Courses',
    component: Courses,
    meta: {
      title: 'Destacame-Buses: Trayectos',
    }
  },
  {
    path: '/choferes',
    name: 'Drivers',
    component: Drivers,
    meta: {
      title: 'Destacame-Buses: Choferes',
    }
  },
  {
    path: '/trips',
    name: 'Trips',
    component: Trips,
    meta: {
      title: 'Destacame-Buses: Crear Viaje',
    }
  },
  {
    path: '/service',
    name: 'Service',
    component: Service,
    meta: {
      title: 'Destacame-Buses: Seleccionar Viaje',
    }
  },
  {
    path: '*',
    component: Home
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

// Obtained from https://www.digitalocean.com/community/tutorials/vuejs-vue-router-modify-head
router.beforeEach((to, from, next) => {
  // This goes through the matched routes from last to first, finding the closest route with a title.
  // eg. if we have /some/deep/nested/route and /some, /deep, and /nested have titles, nested's will be chosen.
  const nearestWithTitle = to.matched.slice().reverse().find(r => r.meta && r.meta.title);

  // Find the nearest route element with meta tags.
  const nearestWithMeta = to.matched.slice().reverse().find(r => r.meta && r.meta.metaTags);
  const previousNearestWithMeta = from.matched.slice().reverse().find(r => r.meta && r.meta.metaTags);

  // If a route with a title was found, set the document (page) title to that value.
  if(nearestWithTitle) document.title = nearestWithTitle.meta.title;

  // Remove any stale meta tags from the document using the key attribute we set below.
  Array.from(document.querySelectorAll('[data-vue-router-controlled]')).map(el => el.parentNode.removeChild(el));

  // Skip rendering meta tags if there are none.
  if(!nearestWithMeta) return next();

  // Turn the meta tag definitions into actual elements in the head.
  nearestWithMeta.meta.metaTags.map(tagDef => {
    const tag = document.createElement('meta');

    Object.keys(tagDef).forEach(key => {
      tag.setAttribute(key, tagDef[key]);
    });

    // We use this to track which meta tags we create, so we don't interfere with other ones.
    tag.setAttribute('data-vue-router-controlled', '');

    return tag;
  })
  // Add the meta tags to the document head.
  .forEach(tag => document.head.appendChild(tag));

  next();
});

export default router
