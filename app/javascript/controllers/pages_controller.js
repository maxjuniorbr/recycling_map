import { Controller } from "@hotwired/stimulus";

let map;
let collectionPointMarkers = []; // Armazenar os marcadores dos pontos de coleta

export default class extends Controller {
    // Método chamado quando o controlador é conectado ao elemento DOM
    connect() {
        // Criar o mapa com uma visão inicial padrão
        map = L.map("map");

        // Adicionar uma camada de mapa usando o provedor de sua escolha
        L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
            maxZoom: 17,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>',
        }).addTo(map);

        // Chamar a função locate() para obter a localização atual do usuário
        map.locate({ setView: true });

        // Registrar a função onLocationFound para ser chamada quando a localização do usuário for encontrada
        map.on("locationfound", this.onLocationFound.bind(this));

        // Registrar a função onLocationError para ser chamada quando ocorrer um erro ao obter a localização do usuário
        map.on("locationerror", this.onLocationError.bind(this));

        // Registrar um listener de evento para o evento "moveend" do mapa, que é acionado quando o mapa é movido
        map.on("moveend", () => {
            const center = map.getCenter();
            this.fetchNearbyCollectionPoints(center.lat, center.lng);
        });

        // Adicionar um botão de localização no mapa
        this.addLocationButton(map);

        // Adicionar um listener de evento para o formulário de pesquisa
        const searchForm = document.querySelector('form');
        searchForm.addEventListener('submit', this.handleSearchSubmit.bind(this));
    }

    // Função chamada quando a localização do usuário é encontrada
    onLocationFound(e) {
        //L.marker(e.latlng).addTo(map);
        map.setView(e.latlng, 17); // Fixar o zoom em 17
    }

    // Função chamada quando ocorre um erro ao obter a localização do usuário
    onLocationError(e) {
        const campinas = { lat: -22.90556, lng: -47.06083 }; // Coordenadas de Campinas, Brasil
        map.setView(campinas, 17); // Fixar o zoom em 17
    }

    // Função assíncrona para buscar pontos de coleta próximos à localização informada
    async fetchNearbyCollectionPoints(latitude, longitude) {
        // Fazer uma solicitação AJAX para buscar os pontos de coleta próximos à localização informada
        const response = await fetch(`/collection_points/nearby?latitude=${encodeURIComponent(latitude)}&longitude=${encodeURIComponent(longitude)}`);

        // Extrair os pontos de coleta da resposta como um objeto JSON
        const collectionPoints = await response.json();

        // Atualizar o mapa com os novos pontos de coleta
        this.updateCollectionPointMarkers(collectionPoints);
    }


    // Método para atualizar marcadores de pontos de coleta no mapa
    updateCollectionPointMarkers(collectionPoints) {
        // Remover marcadores existentes
        collectionPointMarkers.forEach(marker => {
            map.removeLayer(marker);
        });

        // Limpar array de marcadores
        collectionPointMarkers = [];

        // Adicionar novos marcadores
        collectionPoints.forEach(point => {
            const marker = L.marker([point.latitude, point.longitude]).addTo(map);

            // Criar uma lista de materiais recicláveis aceitos no ponto de coleta
            const materialsList = point.recyclable_materials.map(material => {
                return material.name;
            }).join(', ');

            // Criar o conteúdo do popup do marcador
            const popupContent = `
                <div>
                    <p><b>${point.name}</b></p>
                    <p>Endereço: ${point.address}</p>
                    <p>Contato: ${point.contact}</p>
                    <p>Materiais aceitos: ${materialsList}</p>
                </div>
            `;

            // Associar o popup ao marcador
            marker.bindPopup(popupContent);

            // Adicionar o marcador ao array de marcadores
            collectionPointMarkers.push(marker);
        });
    }

    // Método para adicionar um botão de localização ao mapa
    addLocationButton(map) {
        // Criar um controle personalizado para o botão de localização
        const locationControl = L.control({ position: "topleft" });

        // Definir o conteúdo do controle personalizado
        locationControl.onAdd = function () {
            const container = L.DomUtil.create("div", "leaflet-bar leaflet-control leaflet-control-custom");
            const button = L.DomUtil.create("button", "location-button", container);

            // Definir o ícone do botão como um ícone de localização
            button.innerHTML = '<i class="material-icons" style="font-size: 30px; line-height: 30px; vertical-align: middle;">adjust</i>';

            // Definir o tamanho e estilo do botão
            button.style.width = '30px';
            button.style.height = '30px';
            button.style.padding = '0';
            button.style.border = 'none';
            button.style.background = '#ffffff';

            // Adicionar um evento de clique para obter a localização do usuário e fixar o zoom em 17
            button.onclick = function () {
                map.locate({ setView: true, maxZoom: 17 });
            };

            // Retornar o container do controle personalizado
            return container;
        };

        // Adicionar o controle personalizado ao mapa
        locationControl.addTo(map);
    }

    // Método para lidar com a submissão do formulário de pesquisa
    async handleSearchSubmit(event) {
        event.preventDefault();

        // Obter o texto de pesquisa inserido pelo usuário e limpar espaços em branco e caracteres em caixa baixa
        const searchText = document.getElementById("search").value.trim().toLowerCase();

        // Fazer uma solicitação AJAX para buscar os resultados da pesquisa
        const response = await fetch(`/collection_points/search?query=${encodeURIComponent(searchText)}`);
        const searchResults = await response.json();

        // Atualizar o mapa com os resultados da pesquisa
        this.updateMapWithSearchResults(searchResults);
    }

    // Método para atualizar o mapa com os resultados da pesquisa
    updateMapWithSearchResults(searchResults) {
        if (searchResults.length > 0) {
            // Centralizar o mapa no primeiro resultado da pesquisa e fixar o zoom em 18
            const point = searchResults[0];
            map.setView([point.latitude, point.longitude], 18);
        } else {
            // Mostrar uma mensagem de erro se nenhum resultado for encontrado
            alert("Nenhum ponto de coleta foi encontrado com base na sua pesquisa.");
        }
    }
}