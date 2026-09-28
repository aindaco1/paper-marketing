---
title: Versiones y actualizaciones
description: Versiones y actualizaciones de Paper, la app gratuita y de código abierto para macOS.
lang: es
source_commit: 6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95
generated: true
parent: Operaciones
nav_order: 2
---
<a id="release-workflow"></a>

# Publicar Paper

La publicación es una decisión explícita. Requiere un árbol de Git limpio y confirmado, una revisión exacta y publicada de Platform, comprobaciones de CI, código y Swift aprobadas, pruebas con la app real y notas revisadas. Nunca sustituyas el archivo ni la clave de una versión ya publicada.

1. Actualiza ambas versiones en `Configuration/Info.plist`, modifica `CHANGELOG.md` y escribe `docs/releases/VERSION.md`.
2. Ejecuta las comprobaciones de contribución. Firma y empaqueta con `./script/package.sh --notarize`; el adaptador existente lee las credenciales de Apple Auth en su ubicación. Comprueba firmas, notarización, sellado, Gatekeeper, metadatos del bundle y una compilación nueva del ZIP de código.
3. Genera `outputs/appcast.xml` con `python3 script/generate_appcast.py`. La clave privada Ed25519 de Sparkle permanece en el Llavero, en la cuenta `xyz.dustwave.paper`; solo la pública está en el repositorio. La copia de seguridad segura de la clave corresponde al operador. No exportes una clave privada al repositorio, los logs, los artefactos de CI ni los archivos públicos.
4. Ejecuta `python3 script/verify_release.py` para validar el DMG montado, la app de actualización, el ZIP del código exacto, las sumas de comprobación y el feed firmado. Para una versión publicada, pasa su etiqueta con `--ref vVERSION`; `--directory` admite un directorio de descargas públicas nuevo. Compila el ZIP en un directorio temporal nuevo con `swift test` y `./script/build_and_run.sh --build-only`. Tras fusionar, exige que CI pase en main para ese commit exacto antes de crear la etiqueta.
5. Publica una etiqueta y una versión en `aindaco1/paper` con el DMG, ZIP completo del código, ZIP de actualización, sumas y appcast. El feed oficial es el `appcast.xml` de la última versión. Comprueba los archivos públicos descargados contra los hashes y las firmas locales.
6. Prueba una instalación segura de una versión anterior mediante Sparkle: comprobar, descargar, instalar y volver a abrir. Verifica la versión y el ejecutable finales, conservando la app y las preferencias del usuario. La primera versión con actualizador usa una copia firmada local de prueba, porque la 0.3.0 y anteriores no lo incluyen. Nunca publiques esa copia de prueba.

CI solo compila y valida: no tiene claves de firma ni permisos para publicar versiones. El actualizador instala únicamente cuando el usuario actúa. Compilación local, notarización, feed público y actualización instalada son comprobaciones distintas.

<a id="reporting-relay"></a>

## Relay de informes

Sincroniza los archivos de `integrations/crash-relay` que pertenecen a la app con `node script/sync-crash-relay.mjs /path/to/crash-relay`. Conserva `ReviewedReportGroup`, las rutas de productos, los bindings y los permisos existentes. Ejecuta todas las pruebas del relay y una simulación de despliegue; despliega con su flujo habitual. Si hace falta, añade únicamente Paper a los repositorios seleccionados de la GitHub App. Comprueba con datos sintéticos creación, duplicados, agrupación y reapertura, y cierra los issues de prueba. No borres espacios de nombres existentes para revertir: desactiva `PAPER_REPORTS_ENABLED`.

<a id="retention-after-a-verified-release"></a>

## Qué conservar tras verificar una versión

Guarda en `outputs/` la app firmada actual, el DMG, ZIP de código y actualización, appcast, sumas y comprobantes compactos de validación y notarización. Conserva un checkout de desarrollo, las dependencias fijadas, los scripts y las pruebas. Puedes archivar resultados históricos pequeños en JSON o Markdown. No conserves apps duplicadas, árboles extraídos ni cachés solo para guardar un resultado.

Elimina compilaciones locales antiguas y copias de prueba solo cuando los archivos públicos y la actualización desde una versión anterior hayan pasado. `.build/`, `dist/`, los binarios auxiliares y los directorios temporales del ZIP se pueden regenerar. Comprueba ejecutables en uso e imágenes montadas antes de borrar. Conserva las preferencias, recetas importadas, claves del Llavero, Apple Auth y proyectos ajenos.

Borra una rama solo después de comprobar que está fusionada, no tiene un PR abierto y no pertenece a un worktree activo. Conserva etiquetas y archivos publicados como historial; las versiones anteriores permiten volver atrás y probar el actualizador. No borres el checkout de otra tarea por el mero hecho de haber fusionado su rama.

<a id="source-material"></a>

## Material de origen

Esta página sigue el código de Paper en [`6ff7e17`](https://github.com/aindaco1/paper/tree/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95). Su contenido técnico se mantiene en [docs/releasing.md](https://github.com/aindaco1/paper/blob/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95/docs/releasing.md). Los detalles sobre los servicios de este sitio web se mantienen aquí.
