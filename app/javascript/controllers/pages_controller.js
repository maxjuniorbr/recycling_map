import { Controller } from "@hotwired/stimulus";

let map;

export default class extends Controller {
    // Método chamado quando o controlador é conectado ao elemento DOM
    connect() {
        // Criar o mapa com uma visão inicial padrão
        map = L.map("map");

        // Definir o zoom do mapa como 17
        map.setZoom(17);

        // Adicionar uma camada de mapa usando o provedor de sua escolha
        L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
            maxZoom: 17,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>',
        }).addTo(map);

        // Chamar a função locate() para obter a localização atual do usuário
        map.locate({ setView: true });

        // Função chamada quando a localização do usuário é encontrada
        function onLocationFound(e) {
            L.marker(e.latlng).addTo(map);
            map.setView(e.latlng, 17); // Fixar o zoom em 17
        }

        // Registrar a função onLocationFound para ser chamada quando a localização do usuário for encontrada
        map.on("locationfound", onLocationFound);

        // Adicionar marcadores para collection_points
        this.addCollectionPointMarkers(map);

        // Adicionar um botão de localização no mapa
        this.addLocationButton(map);

        // Adicionar um listener de evento para o formulário de pesquisa
        const searchForm = document.querySelector('form');
        searchForm.addEventListener('submit', this.handleSearchSubmit.bind(this));
    }

    // Método para adicionar marcadores de pontos de coleta ao mapa
    addCollectionPointMarkers(map) {
        // Obter os dados dos pontos de coleta
        const points = window.collectionPointsData;

        // Iterar sobre cada ponto de coleta
        points.forEach((point) => {
            // Adicionar um marcador para o ponto de coleta na posição [latitude, longitude]
            const marker = L.marker([point.latitude, point.longitude]).addTo(map);

            // Criar uma lista de materiais recicláveis aceitos no ponto de coleta
            const materialsList = point.recyclable_materials.map((material) => {
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

            // Adicionar um evento de clique para obter a localização do usuário e fixar o zoom em 15
            button.onclick = function () {
                map.locate({ setView: true, maxZoom: 15 });
            };

            // Retornar o container do controle personalizado
            return container;
        };

        // Adicionar o controle personalizado ao mapa
        locationControl.addTo(map);
    }

    async handleSearchSubmit(event) {
        event.preventDefault();

        const searchText = document.getElementById("search").value.trim().toLowerCase();

        // Fazer uma solicitação AJAX para buscar os resultados da pesquisa
        const response = await fetch(`/collection_points/search?query=${encodeURIComponent(searchText)}`);
        const searchResults = await response.json();

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