---
title: Créditos y licencias
lang: es
description: Créditos y licencias de Paper, la app gratuita y de código abierto para macOS.
parent: Referencia
nav_order: 2
generated: true
---
<a id="good-work-deserves-its-name-on-it"></a>

# El buen trabajo merece llevar su nombre.

Paper es gratis y de código abierto, y siempre lo será. Buena parte de lo que lo hace posible es trabajo que otras personas ya habían compartido.

## Deckle

[Deckle y quienes contribuyen al proyecto](https://github.com/YellowFoxH4XOR/deckle) crearon el motor de texturas y el catálogo de papeles que usa Paper. Paper conserva `TextureRenderer.swift` y `TexturePreset.swift` sin cambios en la revisión [`cb4eb09dc117bb046c3ca83b782c5a9ed53dfd91`](https://github.com/YellowFoxH4XOR/deckle/tree/cb4eb09dc117bb046c3ca83b782c5a9ed53dfd91). Su `CustomPaper.swift` contiene el modelo y la conversión extraídos de `PaperMill.swift`. Las ventanas de textura siguen el enfoque de capas en mosaico de Deckle.

Las 26 texturas incluidas vienen de ese catálogo. Las muestras de esta web se exportan con el mismo motor. Hay código compartido detrás, además de inspiración visual. Gracias a quienes lo pusieron a disposición de los demás.

Copyright (c) 2026 Deckle contributors. [Licencia MIT completa](/assets/licenses/Deckle-MIT.txt). El [manifiesto de dependencias de Paper](https://github.com/aindaco1/paper/blob/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95/docs/vendor-sources.json) registra los hashes y las rutas exactas del código.

Paper es una app independiente. Este reconocimiento no implica que los proyectos originales la respalden.

<a id="other-shoulders"></a>

## Más trabajo compartido

- [Record](https://github.com/aindaco1/record) aporta el adaptador de inicio de sesión y sirve de referencia para los atajos y la colocación en pantalla. Se conserva Copyright (c) 2026 Andrew Jones, bajo MIT.
- [Dust Wave Platform](https://github.com/aindaco1/dust-wave-platform) aporta herramientas fijadas a una revisión y el paquete nativo separado de actualizaciones y diagnóstico. Sus avisos originales se incluyen con la app.
- [Sparkle](https://sparkle-project.org/) se encarga de las actualizaciones firmadas. Su licencia se distribuye con Paper.
- Las herramientas de pruebas de pantalla derivadas de OwlSwitch usan GPL-3.0 y se mantienen separadas. No se incluyen dentro de Paper.app.

Los [avisos completos de terceros](https://github.com/aindaco1/paper/blob/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95/THIRD_PARTY_NOTICES.md) conservan las licencias y la procedencia de las dependencias.

<a id="this-website"></a>

## Este sitio web

El sitio adapta la estructura de Jekyll y Just the Docs de la [web de ASCII VJ Remix](https://github.com/aindaco1/ascii-vj-remix-marketing). El diseño de ventanas toma como referencia WEBSITES WEBSITES WEBSITES! No se usan aquí las imágenes de aquella exposición.

[IBM Plex Mono](https://github.com/IBM/plex) se usa bajo la [SIL Open Font License](/assets/licenses/IBM-Plex-OFL.txt). El icono sale del generador del propio proyecto Paper. [Código del sitio](https://github.com/aindaco1/paper-marketing).
