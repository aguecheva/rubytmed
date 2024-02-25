// app/javascript/controllers/destroy.js
import { Controller } from 'stimulus';

export default class extends Controller {
  delete(event) {
    event.preventDefault();
    const confirmation = confirm('¿Estás seguro de que deseas eliminar esto?');
    if (confirmation) {
      const url = event.target.getAttribute('data-delete-url');
      fetch(url, {
        method: 'DELETE',
        headers: {
          'X-CSRF-Token': Rails.csrfToken(), // Asegúrate de que Rails esté configurado para manejar CSRF tokens.
        },
      })
        .then(response => response.json())
        .then(data => {
          console.log(data.message); // Mensaje de éxito o error desde el servidor.
        })
        .catch(error => {
          console.error('Error al eliminar:', error);
        });
    }
  }
}
