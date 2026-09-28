---
title: Recetas y copias de seguridad
description: Recetas y copias de seguridad de Paper, la app gratuita y de código abierto para macOS.
lang: es
source_commit: 6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95
generated: true
parent: Desarrollo
nav_order: 3
---
<a id="paper-recipes"></a>

# Recetas de Paper

Paper importa recetas JSON compatibles con Deckle, incluidos archivos `.decklepaper.json`. Una receta describe una textura; no contiene una imagen, un plugin ejecutable ni instrucciones para descargar contenido de la web.

<a id="import-an-example"></a>

## Importa un ejemplo

Guarda [Soft Linen](https://github.com/aindaco1/paper/blob/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95/docs/examples/soft-linen.decklepaper.json) y elige **Import paper…** en Paper. Puedes seleccionar varios archivos. Los inválidos muestran un error y los válidos se importan.

Cada archivo admite hasta 1 MiB (1.048.576 bytes), y Paper guarda hasta 50 papeles personalizados. Cada receta importada recibe un identificador local nuevo y conserva su semilla de renderizado. Importar una receta dos veces no funciona igual que volver a importar una copia de biblioteca sin cambios.

<a id="recipe-fields"></a>

## Campos de la receta

El modelo y la conversión están en [`CustomPaper.swift`](https://github.com/aindaco1/paper/blob/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95/Sources/Paper/Vendor/Deckle/CustomPaper.swift), extraídos de la revisión fijada de Deckle. Usa esa implementación como referencia al ampliar una receta.

| Campo | Significado |
| --- | --- |
| `id`, `name` | Identidad original y nombre visible; la importación asigna una identidad local nueva |
| `tintRed`, `tintGreen`, `tintBlue` | Canales de color del tinte |
| `wash` | Intensidad de la capa de tinte |
| `weave`, `blotch` | Aportaciones del entramado y de la textura de baja frecuencia |
| `engineVersion` | Motor: legacy (1), spectral (2) o spectral-plus (3) |
| `seed` | Semilla determinista de renderizado |
| `fiberAngle`, `fiberStrength`, `surfaceRoughness` | Controles del motor spectral-plus |
| `darkGrainStrength`, `lightGrainStrength` | Ajustes opcionales de intensidad del grano |

Las recetas antiguas pueden omitir campos nuevos. El decodificador aplica valores de compatibilidad y, si hace falta, obtiene una semilla determinista a partir de la identidad original. El motor limita los parámetros a sus rangos válidos. Paper rechaza números no finitos y datos incompletos o incompatibles. Elimina los caracteres de control y los espacios al principio y al final del nombre, que debe seguir siendo legible y tener un máximo de 80 caracteres.

Paper permite importar y eliminar recetas. Esta versión no incluye un editor ni una galería en línea.

<a id="library-backups"></a>

## Copias de la biblioteca

**Export library…** crea una copia JSON versionada con recetas personalizadas, favoritos y hasta ocho aspectos guardados. **Import library…** la fusiona con la colección actual. Los identificadores en conflicto de recetas y aspectos se reasignan juntos; volver a importar el mismo contenido no crea duplicados. Una fusión inválida o que supere los límites no cambia nada.

La copia tiene el mismo límite de 1 MiB. No incluye la ciudad, reglas de apps, identidades de pantallas, perfiles de escritorio, atajos ni todos los demás ajustes. Consulta [`PaperArchive.swift`](https://github.com/aindaco1/paper/blob/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95/Sources/Paper/PaperArchive.swift) y sus pruebas para ver el comportamiento exacto.

<a id="credit"></a>

## Créditos

Quienes contribuyen a Deckle crearon el modelo de recetas, la conversión de presets y el motor de texturas que usamos aquí. Paper conserva sus avisos MIT y registra el código exacto en el [manifiesto de dependencias](https://github.com/aindaco1/paper/blob/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95/docs/vendor-sources.json). Consulta los [avisos de terceros](https://github.com/aindaco1/paper/blob/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95/THIRD_PARTY_NOTICES.md).

<a id="source-material"></a>

## Material de origen

Esta página sigue el código de Paper en [`6ff7e17`](https://github.com/aindaco1/paper/tree/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95). Su contenido técnico se mantiene en [docs/recipes.md](https://github.com/aindaco1/paper/blob/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95/docs/recipes.md). Los detalles sobre los servicios de este sitio web se mantienen aquí.
