import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

// ****************************************MODULO QUE ESTABA EN CARPETA INCORRECTA ******************************************************************
// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"
// import "controllers"


//function toggleDataGroup(event) {
  //  var dataGroup = event.target.nextElementSibling;
    //dataGroup.style.display = dataGroup.style.display === 'none' ? 'flex' : 'none';
  //}
  
  // document.addEventListener('DOMContentLoaded', function() {
    // Aquí puedes poner cualquier código que necesite esperar a que el DOM esté completamente cargado.
 // }); 
