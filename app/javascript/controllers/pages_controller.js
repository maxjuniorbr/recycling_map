import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        // Criar o mapa com uma visão inicial padrão
        var map = L.map('map').setView([51.505, -0.09], 13);

        // Adicionar uma camada de mapa usando o provedor de sua escolha
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(map);

        // Chamar a função locate() para obter a localização atual do usuário
        map.locate({ setView: true, maxZoom: 13 });

        // Adicionar um marcador na posição atual do usuário
        function onLocationFound(e) {
            L.marker(e.latlng).addTo(map);
        }
        map.on('locationfound', onLocationFound);
    }
}