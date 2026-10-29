---
title: Primeros pasos
description: Primeros pasos de Paper, la app gratuita y de código abierto para macOS.
lang: es
source_commit: d20a6dfa0c6f9195eb544b21826eacbd0b3bcf58
generated: true
parent: Desarrollo
nav_order: 1
---
<a id="contributing-to-paper"></a>

# Contribuir a Paper

Usa Xcode 27 o posterior, Node 24 y un Mac con Apple Silicon. Inicializa la revisión exacta del submódulo Platform con `git submodule update --init --recursive`. Si modificas los archivos incorporados de Deckle o Record, actualiza también su procedencia y las pruebas conservadas.

Cierra la copia instalada de Paper antes de ejecutar una compilación de desarrollo o las pruebas nativas. De lo contrario, la regla de instancia única abre la app que ya estaba en ejecución. Los ajustes habituales de la app están separados de las preferencias desechables de las pruebas nativas.

Antes de abrir un pull request:

```sh
node script/validate.mjs
node --test Tests/relay/*.test.mjs
swift test --package-path shared/dust-wave-platform/desktop
swift test
./script/build_and_run.sh --verify
```

CI ejecuta las mismas comprobaciones de código, contratos y Swift, y compila una app con firma ad hoc en el runner oficial de GitHub `xcode-27`. La entrada real del puntero, el inicio de sesión, HDR en hardware físico, otras versiones del sistema y la instalación real de actualizaciones se comprueban por separado. Consulta [pruebas](/es/docs/operations/testing/).

Mantén las reglas puras de visibilidad y horarios en PaperCore, y las integraciones del sistema en adaptadores acotados. Conserva una app pequeña y reutiliza los módulos compartidos. No añadas capturas de pantalla, event taps, cambios de gamma, envíos ocultos ni un actualizador propio. Los contratos de informes específicos se quedan en Paper; la agregación del relay sigue siendo compartida. Mantén exactos `Package.resolved` y la revisión de Platform.

Incluye pasos claros para reproducir el problema y las comprobaciones pertinentes. Usa informes y medios sintéticos como ejemplos. Nunca añadas al repositorio credenciales, registros reales de fallos, rutas privadas ni resultados locales. Las compilaciones van en `dist/` y las pruebas de entrega en `outputs/`, ambos ignorados por Git. La app usa MIT; las herramientas separadas de pruebas de pantalla usan GPL-3.0 y no deben incluirse en Paper.app.

<a id="match-the-ci-toolchain"></a>

## Usa las mismas herramientas que CI

El [flujo de CI de la app](https://github.com/aindaco1/paper/blob/d20a6dfa0c6f9195eb544b21826eacbd0b3bcf58/.github/workflows/ci.yml) fija Node **24.22.1** en el entorno **xcode-27**. Usa esa versión exacta de Node para reproducir CI en tu Mac. Node se usa en las comprobaciones de desarrollo; no se incluye en Paper.

El flujo también ejecuta la búsqueda de secretos en los archivos versionados y las pruebas de los oráculos de pantallas nativas en Python. Consulta el flujo fijado a este commit para ver la secuencia completa. Que CI pase no demuestra el comportamiento en pantallas reales, la notarización ni la instalación de actualizaciones.

<a id="source-material"></a>

## Material de origen

Esta página sigue el código de Paper en [`d20a6df`](https://github.com/aindaco1/paper/tree/d20a6dfa0c6f9195eb544b21826eacbd0b3bcf58). Su contenido técnico se mantiene en [CONTRIBUTING.md](https://github.com/aindaco1/paper/blob/d20a6dfa0c6f9195eb544b21826eacbd0b3bcf58/CONTRIBUTING.md). Los detalles sobre los servicios de este sitio web se mantienen aquí.
