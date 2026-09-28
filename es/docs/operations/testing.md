---
title: Pruebas
description: Pruebas de Paper, la app gratuita y de código abierto para macOS.
lang: es
source_commit: 6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95
generated: true
parent: Operaciones
nav_order: 1
---
<a id="paper-validation"></a>

# Pruebas de Paper

Esta guía distingue las pruebas automáticas, las comprobaciones locales de la app y la validación más amplia de una versión.

Para la versión actual, consulta la [validación de Paper 1.0.3](https://github.com/aindaco1/paper/blob/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95/docs/validation/1.0.3.md). Los resultados de versiones anteriores son históricos.

La corrección del Dock y Command-Tab tiene sus propias [pruebas de regresión](https://github.com/aindaco1/paper/blob/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95/docs/validation/dock-command-tab.md), con interacciones reales de escritorio y comprobaciones de la regla de detección de Mission Control.

La cobertura automática incluye las pruebas conservadas del motor de Deckle y del servicio de inicio de sesión de Record. También comprueba límites de horarios, cambios de hora, vencimiento de pausas, prioridad de las reglas manuales, de pantallas, apps y energía, recuperación de datos dañados, identidad y semilla de recetas, errores parciales de importación, y configuración de foco y entrada de las ventanas.

Ejecuta:

```sh
node script/validate.mjs
swift test
./script/build_and_run.sh --verify
```

Las comprobaciones locales deben usar la app empaquetada real: activar y desactivar, cambiar textura e intensidad, pausar y reanudar desde el menú, excluir una pantalla y una app, comprobar horarios, importar recetas válidas e inválidas, reiniciar para verificar persistencia, usar el atajo global y salir correctamente. No cambies el inicio de sesión ni los ajustes de batería del sistema solo para conseguir un resultado positivo. Usa las pruebas de adaptadores y reglas, y deja las comprobaciones reales pendientes por separado.

El mínimo declarado es macOS 13 y el binario es arm64. Antes de afirmar compatibilidad amplia, hacen falta pruebas con macOS 13/14/15/26, otros equipos Apple Silicon, M1 con memoria base, HDR/EDR, monitores externos diferentes, pantalla completa y Stage Manager, conexión en caliente, suspensión y herramientas para compartir pantalla. La distribución con Developer ID, la notarización y la instalación desde el DMG firmado se comprueban aparte.

<a id="source-material"></a>

## Material de origen

Esta página sigue el código de Paper en [`6ff7e17`](https://github.com/aindaco1/paper/tree/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95). Su contenido técnico se mantiene en [docs/testing.md](https://github.com/aindaco1/paper/blob/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95/docs/testing.md). Los detalles sobre los servicios de este sitio web se mantienen aquí.
