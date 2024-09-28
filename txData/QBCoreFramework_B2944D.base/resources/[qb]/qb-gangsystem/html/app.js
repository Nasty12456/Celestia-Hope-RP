/* ----<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- 

--<+>-- --<+>--  --<+>--  --<+>-- ☾ AMERICAN SCRIPT ☾ --<+>-- --<+>--  --<+>--  --<+>-- 

--<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- */

amphonegang = {}

/* MISSION CONFIGURATION */

max_misiones_tiendas = 10


/* CONFIGURATION ENABLED TO ADD NEW DRUGS pOUNT */

icon1name = "Sell Cocaina"
bgColor1 = "#ffffff"


icon2name = "Sell Marihuana´s"
bgColor2 = "#50b045"


icon3name = "Sell Crack"
bgColor3 = "#ffffff"


icon4name = "Sell Metanfetaminas"
bgColor4 = "#5da2d3"


icon5name = "Sell Heroina"
bgColor5 = "#d8cc70"

/* ---------------- */







































/* ------------------------ */

var buttonsound = document.getElementById("buttonsound");


$(document).ready(function(){
    // console.log('Fitbit is loaded..')

    window.addEventListener('message', function(event){
        var eventData = event.data;

        if (eventData.action == "OpenCopsUI") {
            amphonegang.Open();

// Simula la recepción de datos de event.data.information.tienda
const maxTiendas = max_misiones_tiendas; // Máximo de 10 tiendas
const tiendaValue = event.data.information.tienda; // Valor de tiendas recibido

// Asegúrate de que el valor de tiendas no exceda el máximo
const tiendasClamped = Math.min(tiendaValue, maxTiendas);

// Llama a la función para actualizar la barra de progreso
updateProgressBar(tiendasClamped, maxTiendas);

// Calcula el valor para mostrar (agregando "/10")
const displayValue = `${tiendaValue}/10`;
$("#descbandaba").html('<b style="font-size:15px;">' + event.data.information.name + '</b><p style="font-size:16px; color: #909090;"></p>');
$("#descpuntosba").html('<b style="font-size:15px;">' + event.data.information.respeto + '</b><p style="font-size:16px; color: #909090;"></p>');
$("#test1").html('<b style="font-size:15px;">' + displayValue + '</b><p style="font-size:16px; color: #909090;"></p>');
                            $(".videobg").show();
                            $(".map-container").fadeOut(150);
							
                            $(".title-screen").fadeIn(0, function() {

                                setTimeout(function() {
                                    $(".logo-title").addClass("parpadeo");
									
                                    $(".fondo-negro").fadeOut(1500);
                                }, 1000);
                            });
        }
    });
});


$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27:
            amphonegang.Close();
            break;
    }
});

amphonegang.Open = function() {
    $(".container").fadeIn(150);
}

amphonegang.Close = function() {
    $(".container").fadeOut(150);
    $(".textoprimero").fadeOut(150);
	$(".textosegundo").fadeOut(150);
    $(".map-container").fadeOut(150);
    $.post('https://qb-gangsystem/close')
}




$(".slider").on("click", function() {
 
    $(".textoprimero").fadeIn(150);

});


$(".slider2").on("click", function() {
 
    $(".textosegundo").fadeIn(150);

});

$(".btn--star").on("click", function() {
     $(".container").fadeOut(150);
    $(".textoprimero").fadeOut(150);
	$(".textosegundo").fadeOut(150);
    $.post('https://am_policephone/close')
    /* $.post('https://am_policephone/startheist') */

});


const indicator = document.querySelector('.nav-indicator');
const items = document.querySelectorAll('.nav-item');

function handleIndicator(el) {
  items.forEach(item => {
    item.classList.remove('is-active');
    item.removeAttribute('style');
  });

  indicator.style.width = `${el.offsetWidth}px`;
  indicator.style.left = `${el.offsetLeft}px`;
  indicator.style.backgroundColor = el.getAttribute('active-color');

  el.classList.add('is-active');
  
  el.style.color = el.getAttribute('active-color');
}


items.forEach((item, index) => {
  item.addEventListener('click', e => {handleIndicator(e.target);});

  item.classList.contains('is-active') && handleIndicator(item);
});




        // Elementos HTML
        var mapContainer = document.getElementById('map-container');
        var mapImage = document.getElementById('map-image');
var icons = []; // Almacena las referencias a los iconos
        // Inicialización de valores
        var scale = 1;
        var translateX = 0;
        var translateY = 0;

        // Función para aplicar transformación al mapa
        function applyTransform() {
            mapImage.style.transform = `translate(${translateX}px, ${translateY}px) scale(${scale})`;
			
            // Actualiza las coordenadas de los iconos en función del zoom y el desplazamiento
            icons.forEach(function(icon) {
                var originalX = icon.originalX;
                var originalY = icon.originalY;
                var adjustedX = originalX * scale + translateX;
                var adjustedY = originalY * scale + translateY;

                icon.style.left = adjustedX + 'px';
                icon.style.top = adjustedY + 'px';
            });
        }

        // Manejo del zoom
        mapContainer.addEventListener('wheel', function(event) {
            event.preventDefault();

            // Ajusta el factor de zoom (puedes personalizarlo)
            var zoomFactor = 0.1;

            // Aumenta o disminuye el zoom
            scale += event.deltaY > 0 ? -zoomFactor : zoomFactor;

            // Limita el zoom mínimo y máximo
            scale = Math.min(Math.max(scale, 3), 8);

            // Aplica la transformación
            applyTransform();
        });

        // Manejo del desplazamiento
        mapContainer.addEventListener('mousedown', function(event) {
            event.preventDefault();
            var startX = event.clientX;
            var startY = event.clientY;

            // Inicia el seguimiento del mouse para desplazamiento
            document.addEventListener('mousemove', onMouseMove);
            document.addEventListener('mouseup', onMouseUp);

            function onMouseMove(event) {
                var deltaX = event.clientX - startX;
                var deltaY = event.clientY - startY;

                translateX += deltaX;
                translateY += deltaY;

                applyTransform();

                startX = event.clientX;
                startY = event.clientY;
            }

            function onMouseUp() {
                // Detiene el seguimiento del mouse
                document.removeEventListener('mousemove', onMouseMove);
                document.removeEventListener('mouseup', onMouseUp);
            }
        });

        // Función para agregar un icono al mapa
        function addMapIcon(originalX, originalY, backgroundColor) {
            var icon = document.createElement('div');
            icon.className = 'map-icon';
			icon.className = 'map-icon-2';
			icon.className = 'map-icon-3';
            icon.style.backgroundColor = backgroundColor;
            icon.originalX = originalX; // Almacenamos las coordenadas originales
            icon.originalY = originalY;

            // Calcula y establece las coordenadas ajustadas
            var adjustedX = originalX * scale + translateX;
            var adjustedY = originalY * scale + translateY;
            icon.style.left = adjustedX + 'px';
            icon.style.top = adjustedY + 'px';

            mapContainer.appendChild(icon);
            icons.push(icon); // Almacena la referencia al icono en el arreglo
        }

        // Manejo del zoom (el código de zoom es igual que en el ejemplo anterior)

        // Manejo del desplazamiento (el código de desplazamiento es igual que en el ejemplo anterior)

        // Elimina la rotación al cargar completamente la imagen
        mapImage.onload = function() {
            applyTransform(); // Llamamos a la función para aplicar la transformación

            // Ejemplo de agregar un icono al mapa (coordenadas relativas)
            addMapIcon(400, 300, 'red');
        };
        // Ejemplo de interacción con el elemento interactivo
        var interactiveElement = document.getElementById('interactive-element');
        interactiveElement.addEventListener('click', function() {

            // Puedes agregar aquí acciones adicionales
        });
		
		
		
		
		
		
		
		
		
		
		
		
		
		
function home() {
	$(".watch-screen").show();
    $(".container-map").fadeOut(150);
	$(".watch-screen-2").fadeOut(150);
	    $(".misiones").fadeOut(150);
		  buttonsound.play();
		  	$(".pedir-misiones-cocaina").fadeOut(150);
}

function mapa() {
	$(".watch-screen").fadeOut(150);
	$(".misiones").fadeOut(150);
    $(".container-map").show();
	$(".watch-screen-2").show();
	$(".pedir-misiones-cocaina").fadeOut(150);
	   buttonsound.play();
}


function misiones() {
	$(".watch-screen").fadeOut(150);
    $(".container-map").fadeOut(150);
	$(".watch-screen-2").fadeOut(150);
    $(".misiones").show();
		$(".pedir-misiones-cocaina").fadeOut(150);
	  buttonsound.play();
}

/* -----------------   MISIONES DE COCAINA FUNCIONES ---- */

function codpmc1accept() {
	$(".pedir-misiones-cocaina").fadeOut(150);
	
	$.post('https://qb-gangsystem/activar-misioncocaina', JSON.stringify())

}

function codpmc1dennied() {
	$(".pedir-misiones-cocaina").fadeOut(150);

}

function mapiconmision1() {
    $(".pedir-misiones-cocaina").show();
}



/* ---------------------------------------------------------- */
document.getElementById('icon1').textContent = icon1name;
document.getElementById('icon-color-1').style.backgroundColor = bgColor1;


document.getElementById('icon2').textContent = icon2name;
 document.getElementById('icon-color-2').style.backgroundColor = bgColor2;
 
 
document.getElementById('icon3').textContent = icon3name;
 document.getElementById('icon-color-3').style.backgroundColor = bgColor3;


document.getElementById('icon4').textContent = icon4name;
 document.getElementById('icon-color-4').style.backgroundColor = bgColor4;


document.getElementById('icon5').textContent = icon5name;
 document.getElementById('icon-color-5').style.backgroundColor = bgColor5;









// Obtén una referencia a la barra de progreso y el porcentaje
const progressBar = document.getElementById('progress-bar');


// Función para actualizar la barra de progreso
function updateProgressBar(value, maxValue) {
  const percentage = (value / maxValue) * 100;
  progressBar.style.width = `${percentage}%`;

}
