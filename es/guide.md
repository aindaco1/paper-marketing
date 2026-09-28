---
title: Guía de uso
description: Guía de uso de Paper, la app gratuita y de código abierto para macOS.
lang: es
source_commit: 871398865f5ee28615b51d21dfcc30e4b3604d48
generated: true
layout: page
permalink: /es/guide/
nav_exclude: true
---
<a id="get-comfortable-with-paper"></a>

# Ponte cómodo con Paper

Paper añade una textura de papel sobre las pantallas de tu Mac. Tus apps siguen funcionando como siempre: puedes hacer clic, escribir, desplazarte y mover ventanas a través de ella. Tus documentos quedan tal cual. El ordenador simplemente se ha puesto un poco de papel.

Funciona en Mac con Apple Silicon y macOS 13 o posterior. **Gratis y de código abierto. Siempre.** Las 26 texturas incluidas vienen de [Deckle](https://github.com/YellowFoxH4XOR/deckle), cuyos colaboradores crearon el motor de texturas y el catálogo de papeles que usa Paper. Gracias, Deckle.

Para empezar, instala Paper, deja **Soft Wove** seleccionado y ajusta **Intensity** mientras miras algo que leas de verdad. El resto puede esperar hasta que lo necesites.

¿Buscas un control concreto?

- [Instalar y encontrar Paper](#install)
- [Textura, intensidad y grano](#pick-a-paper)
- [Favoritos y estilos guardados](#favorites-and-saved-looks)
- [Horarios, estilos automáticos y reglas de batería](#make-it-fit-your-day)
- [Pausas, descansos y apps excluidas](#pause-or-get-out-of-the-way)
- [Pantallas, perfiles de escritorio, Desk Lamp y franja de lectura](#a-few-extra-controls)
- [Atajos de teclado y la app Atajos de Apple](#shortcuts)
- [Importar papeles y guardar tu colección](#bring-your-own-paper)
- [Privacidad, actualizaciones y ayuda](#privacy-and-help)

<a id="install"></a>

## Instalar

1. Descarga el DMG actual de [las versiones de Paper](https://github.com/aindaco1/paper/releases/latest). Un DMG es la imagen de disco que contiene la app.
2. Ábrelo y arrastra **Paper** a **Aplicaciones**.
3. Abre Paper desde Aplicaciones. Verás su ventana de ajustes y un icono de Paper en la barra de menús, en la parte superior de la pantalla.

El interruptor **Enable Paper** activa y desactiva el efecto. Pruébalo un par de veces para comparar la textura con tu pantalla original. Cerrar los ajustes deja Paper en marcha; haz clic en su icono de la barra de menús y elige **Settings…** para volver. **Quit Paper** cierra la app y quita el efecto.

Si quieres que Paper se abra al iniciar sesión en el Mac, activa **Launch at login** en **Preferences**. Si macOS pide permiso, usa **Approve in Login Items…** para completar ese paso. Abrirse al iniciar sesión no hace que Paper ignore tus reglas de pausa.

<a id="keeping-it-up-to-date"></a>

### Mantenerlo al día

Elige **Check for Updates…** en la barra de menús o en **Updates & support**, dentro de los ajustes. Paper puede buscar actualizaciones automáticamente, pero instalarlas sigue requiriendo una acción tuya. Puedes desactivar la búsqueda automática en los ajustes.

Si vienes de la versión 0.3.0 o una anterior, descarga e instala una copia actual manualmente una vez para disponer del actualizador integrado. Cierra cualquier copia anterior a la 1.0 antes de reemplazarla.

<a id="pick-a-paper"></a>

## Elige un papel

Entra en **Your paper** en los ajustes y elige una **Texture**. Soft Wove es el punto de partida; los otros papeles tienen distintos tonos y detalles de superficie. Pruébalos sobre un documento, una web y una ventana oscura. Una textura que te gusta en una página vacía puede resultar más intensa en una pantalla llena de cosas.

**Intensity** controla cuánto se nota el papel. Bájalo para una superficie tenue o súbelo para un efecto más visible. El rango va del 5 al 45%; no hay premio por llevar el deslizador al máximo. Al volver a una textura, Paper recuerda la última intensidad que usaste con ella.

**Grain** cambia el tamaño del detalle de la textura. Elige **Fine** para un detalle más pequeño, **Natural** para su escala original o **Coarse** para uno más grande. Esto no cambia la resolución de tu pantalla ni el tamaño del texto.

Si Intensity y Grain no están disponibles, un estilo automático o asignado a una app está controlando esos ajustes. Selecciona una textura o aplica un estilo guardado manualmente para salir del cambio automático y ajustarlo tú.

<a id="favorites-and-saved-looks"></a>

## Favoritos y estilos guardados

Un **favorito** es una textura que quieres encontrar rápido. Haz clic en **Favorite** junto al papel actual. Los favoritos aparecen al principio del selector de texturas y en el menú **Favorites** de la barra de menús. Vuelve a pulsar la estrella para sacar uno de la lista.

Un **estilo guardado** conserva una textura junto con su intensidad y sus ajustes de grano. Puedes guardar un Soft Wove tenue como «Escribir» y un Book Cream más marcado como «Lectura nocturna».

Para crear uno, ajusta el papel a tu gusto, elige **Saved looks → Save current look…** y ponle nombre. Selecciona ese nombre en **Saved looks** para recuperarlo. Paper guarda hasta ocho estilos; guardar con un nombre que ya existe reemplaza ese estilo. **Saved looks → Remove look** permite quitar uno que ya no uses.

Los estilos guardados no incluyen todos los ajustes de Paper. En particular, la intensidad personalizada de cada pantalla sigue siendo independiente, y aplicar un estilo no activa Paper ni cancela una pausa.

<a id="make-it-fit-your-day"></a>

## Haz que encaje con tu día

<a id="show-paper-at-certain-times"></a>

### Mostrar papel a ciertas horas

En **When to show it**, activa **Use a daily schedule**. El horario decide cuándo puede aparecer el efecto.

Para horas fijas, configura **From** y **To** según la hora local de tu Mac. Un intervalo de 6 de la tarde a 7 de la mañana funciona durante la noche. Poner la misma hora de inicio y fin deja Paper disponible todo el día. Si lo apagas tú, esa decisión sigue teniendo prioridad sobre el horario.

También puedes usar el intervalo del amanecer al atardecer, o del atardecer al amanecer. Pulsa **Choose city…**, escribe una ciudad y un país, haz clic en **Find** y selecciona el resultado. Paper calcula las horas de sol para esa ciudad y su zona horaria. No sigue tu ubicación cuando viajas, así que cambia la ciudad si quieres adaptar el horario a otro lugar.

La búsqueda de ciudades usa el servicio de Apple. Una vez elegida la ciudad, las horas de sol se calculan en tu Mac; no hace falta permiso de ubicación. El horario solar necesita una ciudad seleccionada para poder mostrar Paper.

<a id="change-the-look-as-the-day-changes"></a>

### Cambiar de estilo a lo largo del día

**Automatic day/night looks** elige qué estilo guardado usar. Puede funcionar con o sin un horario diario. Por ejemplo, puedes dejar Paper disponible todo el día y usar otro papel después del atardecer.

Guarda primero dos estilos, activa **Automatic day/night looks** y elige una opción en **Switch with**:

- **Sunrise and sunset:** asigna un **Day look** para el día y un **Night look** para la noche, y elige una ciudad.
- **macOS appearance:** asigna un **Light look** y un **Dark look**. Paper sigue la apariencia clara u oscura del Mac; no cambia ese ajuste por ti.

Elige ambos estilos para completar la configuración. Seleccionar una textura o aplicar un estilo manualmente desactiva el cambio automático, para que tu elección se mantenga. Vuelve a activarlo cuando quieras que Paper se encargue otra vez.

<a id="give-an-app-its-own-look"></a>

### Darle a una app su propio estilo

En **App-specific looks**, pulsa **Assign a look to an app…**, selecciona la app y asígnale un estilo guardado. **Use app-specific looks** activa esas asignaciones. Puedes usar un papel discreto mientras escribes en Notas y otro mientras lees en el navegador.

El estilo asignado sigue la app que estés usando y aparece en todas las pantallas habilitadas. No se limita a la ventana de esa app. Cuando cambias a una app sin asignación, Paper usa el estilo de día o noche si esa función está activa; en caso contrario, vuelve a tus ajustes manuales habituales.

El estilo de una app tiene prioridad sobre el de día o noche. No puede saltarse una exclusión ni otra regla de pausa. Elegir una textura o un estilo manualmente también desactiva el cambio según la app; las asignaciones quedan guardadas para volver a activarlas.

<a id="let-battery-rules-handle-a-pause"></a>

### Dejar las pausas en manos de la batería

Hay tres opciones independientes en **When to show it**:

- **Pause on battery** oculta el efecto cuando el Mac está desenchufado y funciona con batería.
- **Pause in Low Power Mode** sigue el modo de bajo consumo de macOS.
- **Pause at low battery** lo oculta al llegar al porcentaje que elijas o bajar de él, mientras el Mac funciona con batería. El umbral inicial es del 20%.

Por ejemplo, deja Pause on battery desactivado y usa un umbral del 20% si quieres papel sin estar enchufado, pero prefieres una pausa cuando queda poca batería. Enchufar el Mac o superar el umbral elimina ese motivo de pausa. Otras reglas, como un descanso con temporizador o una app excluida, pueden seguir ocultando el efecto.

<a id="pause-or-get-out-of-the-way"></a>

## Pausar o apartarse

No hace falta visitar los ajustes cada vez. El icono de la barra de menús ofrece el estado actual, encendido y apagado, descansos, favoritos, la franja de lectura y la pausa para presentaciones.

<a id="off-snooze-or-presentation-pause"></a>

### ¿Apagar, dar un descanso o pausar una presentación?

Usa **Turn Paper off** cuando quieras dejarlo apagado hasta que decidas lo contrario. También puedes usar Enable Paper o el atajo de teclado para activarlo y desactivarlo.

**Snooze** es un descanso con temporizador: 15 minutos, 30 minutos, una hora, dos horas o hasta mañana a las 6. **Custom duration…** acepta entre 1 y 1.440 minutos. Elige **End snooze** para terminar antes. La hora de finalización se conserva al cerrar y volver a abrir Paper; abrirlo no reinicia la cuenta.

**Pause for presentation** es una pausa que terminas tú. Úsala antes de compartir pantalla, grabar, hacer capturas, comprobar colores o abrir una solicitud de autorización protegida. Cuando acabes, elige **End presentation pause**. Esta pausa también se conserva al cerrar y volver a abrir la app.

Comprueba siempre la vista previa de lo que compartes o grabas. Las herramientas de captura tratan estas capas de distintas maneras, así que Paper no promete que una textura activa resulte invisible para ellas. La pausa para presentaciones quita tanto la textura como la iluminación opcional.

<a id="keep-particular-apps-clear"></a>

### Mantener ciertas apps despejadas

En **Pause in these apps**, pulsa **Add app…** y selecciona una app. Paper se pausa mientras esa app está activa y puede volver cuando cambias a otra. Es útil para un editor de fotos, uno de vídeo o cualquier lugar donde necesites ver la imagen sin modificar. Los paneles flotantes de las apps excluidas también quedan por encima de la textura.

Si solo quieres Paper en unas pocas apps, activa **Only show in selected apps** en **App rules** y usa **Add selected app…** para crear tu lista. Con la lista vacía, el efecto no aparecerá en ninguna app. Si una app está en ambas listas, gana la exclusión.

Paper también oculta la textura en Mission Control para que puedas ver las vistas previas de tus espacios. Se mantiene visible al mostrar el Dock o usar Comando-Tab.

<a id="paper-is-on-but-where-did-it-go"></a>

### Paper está encendido, pero ¿dónde se ha metido?

Lee el estado en la parte superior de los ajustes o del menú. Puede indicar **Waiting for your schedule** —esperando al horario—, **Paused on battery** —pausado por la batería— o **Waiting for a selected app** —esperando una app seleccionada—. Enable Paper permite que funcione el efecto; los demás controles deciden si debe verse en ese momento.

Comprueba si hay un descanso o una pausa para presentaciones, una app excluida, un horario o una regla de batería. Si todas las pantallas están apagadas en Displays, activa la que quieras usar. Terminar una pausa no cancela las demás. No deberías tener que rehacer tu papel favorito para resolverlo.

<a id="a-few-extra-controls"></a>

## Algunos controles más

<a id="choose-which-displays-get-paper"></a>

### Elegir qué pantallas llevan papel

En **Displays**, cada pantalla conectada tiene su propio interruptor. Puedes dejar textura en la pantalla del portátil y mantener despejada una externa, por ejemplo.

Activa **Custom intensity** en una pantalla para darle su propio deslizador de intensidad. Viene bien cuando el mismo papel se nota más en una pantalla que en otra. Desactívalo para volver a usar la intensidad del estilo actual. Elegir otra textura o estilo guardado no borra la intensidad personalizada de una pantalla.

<a id="remember-a-desk-setup"></a>

### Recordar un escritorio

**Desk profiles** guarda la textura y las reglas para un conjunto concreto de pantallas conectadas. Ajusta todo, escribe un nombre en **Desk name** y pulsa **Save this setup**. Paper lo recupera cuando vuelven a conectarse esas mismas pantallas o cuando se abre con ellas conectadas.

El perfil reconoce las pantallas concretas, no solo cuántas hay. Puedes tener una configuración para el portátil solo y otra para el monitor de tu escritorio. Los cambios posteriores no se guardan sin avisar dentro del perfil: pulsa Save this setup otra vez para reemplazar el perfil de esa combinación de pantallas.

Recuperar un escritorio no deshace el apagado manual, las exclusiones actuales de pantallas, un descanso ni una pausa para presentaciones. Los perfiles se quedan en este Mac y no se incluyen al exportar la biblioteca.

<a id="add-a-little-warmth-with-desk-lamp"></a>

### Añadir un poco de calidez con Desk Lamp

Despliega **Desk Lamp** en **Surface options** y activa **Warm ambient light**. **Warmth** cambia el tono; **Strength**, cuánto se nota. La capa de color se mezcla con la intensidad del papel, así que un papel muy tenue también da una lámpara tenue.

Es una capa fija de color sobre la pantalla. No sigue al puntero ni cambia el ajuste de brillo del Mac. Pausa Paper cuando necesites precisión de color, por ejemplo al valorar los colores de una fotografía. Un tinte amarillo acogedor sigue siendo un tinte amarillo.

<a id="use-the-reading-strip"></a>

### Usar la franja de lectura

Elige **Show reading strip** en la barra de menús para dejar una banda horizontal despejada en el papel y Desk Lamp. En **Surface options → Reading strip**, ajusta **Strip height** y **Strip position (bottom to top)** para darle la altura y la posición que quieras.

La franja se queda donde la pongas; no sigue al puntero ni se desplaza con el documento. Aparece en cada pantalla habilitada. Puedes asignar atajos para moverla arriba y abajo y elegir **Hide reading strip** cuando termines. Respeta las reglas habituales de pausa de Paper.

<a id="shortcuts"></a>

## Atajos

<a id="keep-a-few-controls-on-the-keyboard"></a>

### Tener algunos controles a mano en el teclado

El atajo predeterminado es **Mayúsculas–Opción–Comando–P** (⇧⌥⌘P). Activa o desactiva Paper sin abrir el menú.

En **Shortcuts**, dentro de los ajustes, activa **Enable global shortcuts** y pulsa la combinación junto a un comando para cambiarla. También puedes asignar teclas para un descanso de 15 minutos, pasar al siguiente favorito, mover la franja de lectura arriba o abajo y pausar una presentación. Esos comandos adicionales empiezan sin atajo asignado.

Elige una letra e incluye Comando o Control. Los atajos usan las posiciones físicas de las teclas A–Z, algo a tener en cuenta si cambias de distribución de teclado. Si Paper indica un conflicto, elige otra combinación. Puedes borrar un atajo opcional o restaurar el predeterminado para activar y desactivar Paper.

<a id="put-paper-into-an-apple-shortcut"></a>

### Incluir Paper en un atajo de Apple

En la app **Atajos** de Apple, busca Paper al añadir una acción. Ofrece **Toggle Paper**, **Set Paper Enabled**, **Snooze Paper**, **Select Paper Texture** y **Apply Paper Look**.

Para crear un atajo sencillo de escritura, abre tu app de escribir, selecciona el estilo «Escribir» con Apply Paper Look y añade Set Paper Enabled con Enabled activado. Así el atajo tiene un resultado previsible; Toggle Paper invierte el estado en el que se encuentre la app.

Estas acciones usan los mismos controles que Paper. Seleccionar una textura o un estilo termina el cambio automático. Activar Paper cancela un descanso con temporizador, pero siguen vigentes la pausa para presentaciones, las exclusiones de apps, los horarios y las reglas de batería.

<a id="bring-your-own-paper"></a>

## Trae tu propio papel

<a id="import-a-texture-recipe"></a>

### Importar una receta de textura

**Import paper…**, en Your paper, acepta recetas JSON compatibles con Deckle, incluidos los archivos que terminan en `.decklepaper.json`. Una receta contiene las instrucciones para dibujar una textura. No hace falta leer ni editar el archivo para usarlo; una foto o un fondo de pantalla no sirve en su lugar.

Guarda una receta en el Mac, elige Import paper… y selecciona el archivo. Puedes seleccionar varios a la vez. Paper guarda hasta 50 papeles personalizados, con un límite de 1 MB por archivo. Si no puede importar alguno, te lo indica; los otros archivos válidos de esa selección pueden añadirse igualmente.

Para probar un ejemplo, abre [Soft Linen](https://github.com/aindaco1/paper/blob/871398865f5ee28615b51d21dfcc30e4b3604d48/docs/examples/soft-linen.decklepaper.json) en GitHub y usa **Download raw file**. Importa en Paper el archivo `.decklepaper.json` descargado. Para quitar un papel personalizado, selecciónalo y elige **Remove imported paper**. La colección de Deckle incluida en la app sigue disponible.

<a id="back-up-your-collection"></a>

### Guardar una copia de tu colección

En **Library backup**, elige **Export library…** y guarda el archivo donde suelas conservar tus copias de seguridad. Incluye tus papeles personalizados, favoritos y estilos guardados.

**Import library…** añade esa colección a la que ya tienes. No borra la colección actual, e importar de nuevo una copia sin cambios no lo duplica todo. Si la copia no es válida o superaría los límites de la colección, la importación deja la colección intacta.

Una copia de la biblioteca no guarda todas tus preferencias: quedan fuera la ciudad, las reglas de apps, la configuración de pantallas, los perfiles de escritorio y los atajos de teclado. Configúralos por separado en otro Mac. Para consultar detalles de los archivos y ejemplos, ve a [recetas y copias de seguridad](/es/docs/development/recipes/).

<a id="privacy-and-help"></a>

## Privacidad y ayuda

Paper no captura lo que hay en tu pantalla y no necesita permisos de Accesibilidad, Monitorización de entrada ni Grabación de pantalla. Tus ajustes y recetas se quedan en el Mac. Dibuja una capa superpuesta en lugar de cambiar los ajustes de color de la pantalla.

Las búsquedas de ciudades usan el servicio de Apple; las comprobaciones de actualizaciones, GitHub. Los informes de diagnóstico solo se envían después de que los revises y pulses **Send**. La [página de privacidad](/es/privacy/) explica esas conexiones.

Si algo no se comporta como esperabas, elige **Help & diagnostics…** en los ajustes o la barra de menús, o empieza por [Ayuda](/es/help/). Cuenta qué intentabas hacer y qué ocurrió. Para informar de un problema de seguridad sensible, usa el canal privado indicado en [Seguridad](https://github.com/aindaco1/paper/blob/871398865f5ee28615b51d21dfcc30e4b3604d48/SECURITY.md).

<a id="source-material"></a>

## Material de origen

Esta página sigue el código de Paper en [`8713988`](https://github.com/aindaco1/paper/tree/871398865f5ee28615b51d21dfcc30e4b3604d48). Su contenido se mantiene en [docs/user-guide.md](https://github.com/aindaco1/paper/blob/871398865f5ee28615b51d21dfcc30e4b3604d48/docs/user-guide.md). Los detalles sobre los servicios de este sitio web se mantienen aquí.
