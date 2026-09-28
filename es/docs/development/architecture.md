---
title: Arquitectura
description: Arquitectura de Paper, la app gratuita y de código abierto para macOS.
lang: es
source_commit: 6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95
generated: true
parent: Desarrollo
nav_order: 2
---
<a id="paper-architecture"></a>

# Arquitectura de Paper

Paper es una app de barra de menús para macOS y Apple Silicon. SwiftPM separa las reglas de funcionamiento de las integraciones con el sistema: `PaperCore` contiene los tipos de valor y las decisiones; el ejecutable `Paper` se encarga de AppKit, SwiftUI, la persistencia y los adaptadores.

<a id="follow-a-setting"></a>

## Sigue el recorrido de un ajuste

1. Una acción de menú, un control de Settings o un App Intent llama a `PaperState`.
2. `PaperState` actualiza los ajustes tipados, normaliza las selecciones y guarda el estado local. Para decidir la visibilidad, usa las reglas de `PaperCore`.
3. `OverlayController` observa el estado y los eventos del sistema, y decide qué pantallas necesitan una ventana. Los cambios de estado que llegan muy seguidos se agrupan.
4. Cada pantalla habilitada recibe una `PaperOverlayWindow` que no se activa y deja pasar los clics. Un mosaico de textura de Deckle almacenado en caché alimenta su capa; el alfa de la ventana determina la intensidad.

La desactivación manual y las exclusiones de pantalla siempre tienen prioridad. Los aspectos guardados y los cambios automáticos no anulan Snooze, la pausa de presentación, los horarios ni las reglas de energía. Revisa las reglas y sus pruebas antes de cambiar su prioridad.

<a id="source-map"></a>

## Mapa del código

| Área | Archivo principal | Responsabilidad |
| --- | --- | --- |
| Ciclo de vida | `Sources/Paper/PaperApp.swift` | Barra de menús, apertura de Settings y ciclo de vida de la app |
| Estado y comandos | `Sources/Paper/PaperState.swift` | Ajustes, aspectos, importaciones, persistencia y comandos compartidos |
| Reglas puras | `Sources/PaperCore/` | Visibilidad, horarios, cálculo solar, aspectos, atajos y modelos de biblioteca |
| Ventanas de textura | `Sources/Paper/OverlayController.swift` | Ciclo de vida de las pantallas, ventanas y colocación de texturas |
| Adaptadores del sistema | `SystemEnvironment.swift`, `SystemOverviewMonitor.swift`, `ExcludedPanelMonitor.swift` | Cambios de energía y apps; consultas acotadas a metadatos públicos de ventanas |
| Interfaz de ajustes | `PaperView.swift`, `ScheduleControls.swift`, `LibraryControls.swift`, `WorkflowControls.swift` | Controles de configuración |
| Automatización | `PaperIntents.swift`, `GlobalShortcut.swift` | Acciones nativas de Atajos y registro de atajos de teclado |
| Importaciones y copias | `BoundedJSONFile.swift`, `PaperArchive.swift` | Lecturas acotadas, validación y fusión atómica de bibliotecas |
| Diagnóstico | `PaperDiagnostics.swift` | Esquema filtrado de informes de Paper y adaptador compartido |
| Instancia única | `SingleInstance.swift` | Una instancia por usuario y reapertura de Settings |

Los archivos sin directorio indicado están en `Sources/Paper/`.

<a id="rendering-and-provenance"></a>

## Renderizado y procedencia

Paper conserva sin cambios las versiones fijadas de `TexturePreset.swift` y `TextureRenderer.swift` de Deckle. `CustomPaper.swift` contiene el modelo y la conversión extraídos de `PaperMill.swift`. El motor genera mosaicos reutilizables en lugar de una imagen del tamaño de la pantalla en cada actualización. Admite los motores legacy, spectral y spectral-plus, con cachés de tamaño limitado.

El catálogo viene directamente de Deckle. Paper coloca Soft Wove primero como opción inicial, sin mantener una lista aparte de identificadores. Los ajustes por pantalla cambian la intensidad efectiva de forma independiente al aspecto elegido.

Los [avisos de terceros](https://github.com/aindaco1/paper/blob/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95/THIRD_PARTY_NOTICES.md) y el [manifiesto de dependencias](https://github.com/aindaco1/paper/blob/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95/docs/vendor-sources.json) recogen las revisiones, los hashes y las licencias. Importar una receta cambia su identidad local y conserva la semilla de renderizado; consulta [recetas](/es/docs/development/recipes/).

<a id="system-behavior"></a>

## Comportamiento del sistema

Las ventanas de textura no toman el foco ni interceptan la entrada. Paper usa metadatos públicos de ventanas para las exclusiones y Mission Control. No captura la pantalla, lee títulos de ventanas, instala event taps ni cambia la gamma. Los monitores de visibilidad se detienen cuando la textura no puede mostrarse.

La activación de apps, los cambios de pantalla, la suspensión y reactivación, y los cambios de sesión llegan a adaptadores con funciones acotadas. Los horarios fijos usan temporizadores para sus límites y notificaciones de cambios de hora. Los horarios solares consultan la ciudad introducida mediante el geocodificador de Apple y calculan las horas solares aproximadas localmente.

Las pruebas de `PaperCore` comprueban las reglas. No demuestran el comportamiento con todas las apps a pantalla completa, monitores, versiones del sistema o herramientas de captura. La guía de [pruebas](/es/docs/operations/testing/) distingue estas comprobaciones.

<a id="local-state-and-services"></a>

## Estado local y servicios

Los ajustes usan el dominio de preferencias `xyz.dustwave.paper`. Las recetas y las referencias de la biblioteca se guardan juntas. Si una fusión de biblioteca es inválida o supera los límites, la colección existente no cambia. Los ajustes ilegibles se conservan para recuperarlos y la textura queda desactivada.

Los perfiles de escritorio, las asignaciones a apps, los atajos y otros ajustes del equipo se guardan localmente. Las exportaciones incluyen papeles personalizados, favoritos y aspectos guardados, pero no todas las preferencias.

El paquete de escritorio de Dust Wave Platform, fijado a una revisión concreta, integra Sparkle y el diagnóstico con revisión previa. Paper mantiene su propio esquema de informes y destino de envío. La app no incluye un motor de voz ni de IA. Consulta [privacidad](/es/privacy/), [integración de escritorio](https://github.com/aindaco1/paper/blob/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95/docs/SHARED_DESKTOP_MIGRATION.md) y [publicación](/es/docs/operations/releasing/).

<a id="changing-the-code"></a>

## Cambiar el código

Mantén las nuevas reglas comprobables en `PaperCore` y las API de Apple en adaptadores acotados. Reutiliza los comandos de `PaperState` para que menús, Settings, atajos y App Intents se comporten igual. Conserva las versiones fijadas del código externo y su procedencia. Sigue la [guía de contribución](/es/docs/development/quickstart/) para ejecutar las comprobaciones.

<a id="source-material"></a>

## Material de origen

Esta página sigue el código de Paper en [`6ff7e17`](https://github.com/aindaco1/paper/tree/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95). Su contenido técnico se mantiene en [docs/architecture.md](https://github.com/aindaco1/paper/blob/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95/docs/architecture.md). Los detalles sobre los servicios de este sitio web se mantienen aquí.
