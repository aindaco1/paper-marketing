---
title: Historial de cambios
description: Historial de cambios de Paper, la app gratuita y de código abierto para macOS.
lang: es
source_commit: 6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95
generated: true
parent: Referencia
nav_order: 1
---
<a id="changelog"></a>

# Historial de cambios

## 1.0.3 - 2026-09-25

- La textura sigue visible al mostrar el Dock o usar Command-Tab. Paper distingue los fondos de pantalla completa de estas funciones de las vistas de Mission Control. El cambio incluye pruebas de las reglas y comprobaciones en el escritorio real.

## 1.0.2 - 2026-09-25

- La textura se oculta en Mission Control para que las vistas previas de los espacios sigan siendo legibles, y vuelve al salir. Se conserva la compatibilidad con pantalla completa y las reglas de pausa, incluso al entrar y salir varias veces.

## 1.0.1 - 2026-09-25

- Adopta el núcleo compartido de soporte para plataformas Apple mediante la API compatible de diagnóstico de escritorio. Se mantienen la revisión de informes, el envío explícito, el consentimiento para las actualizaciones y el funcionamiento de la app.

## 1.0.0 - 2026-09-25

- Añade aspectos guardados que siguen la apariencia del sistema o la app activa, perfiles para cada conjunto de pantallas y memoria de intensidad por textura.
- Añade pausa para presentaciones, control de la franja de lectura y selección de favoritos desde el menú, además de atajos configurables con avisos de conflicto.
- Añade los controles estáticos de Desk Lamp y un umbral opcional de batería baja.
- Impide ejecutar varias copias de Paper a la vez y elimina las ventanas de textura mientras el efecto está en pausa.
- Amplía las pruebas de reglas, flujos nativos y hardware; las comprobaciones físicas pendientes siguen señaladas como tales.

## 0.4.2 - 2026-09-25

- Actualiza el paquete de escritorio compartido a la versión 0.2.0 mediante la dependencia fijada de Dust Wave Platform. Se mantienen el consentimiento para las actualizaciones y el comportamiento de diagnóstico propio de Paper. Consulta el [registro de migración](https://github.com/aindaco1/paper/blob/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95/docs/SHARED_DESKTOP_MIGRATION.md).

## 0.4.1

- Simplifica Settings: el interruptor principal sirve para comparar el efecto y Snooze queda en la barra de menús.
- Reúne las acciones de ayuda y diagnóstico en un pie común, iguala el tamaño de los controles y evita que los textos de soporte y privacidad se corten.

## 0.4.0

- Añade actualizaciones firmadas con Sparkle mediante el paquete de escritorio independiente de Platform, con preferencia de comprobación automática y comprobación manual.
- Añade registros revisables y filtrados para proteger la privacidad, resúmenes de fallos de Paper, exportación local, envío explícito a GitHub y agrupación de incidencias mediante el servicio compartido.
- Aplaza la instalación de actualizaciones mientras se envía un informe y conserva su identificador para reintentar el envío.
- Mantiene los inicios de sesión en la barra de menús y el comportamiento al volver a abrir la app.
- Añade integración continua, documentación de contribución, privacidad y publicación, y una escena estática para comprobar HDR y entrada en equipos reales.

## 0.3.0

Modo de apps seleccionadas, aspectos automáticos de día y noche, ajustes de intensidad por pantalla, copia atómica de la biblioteca y límites reforzados de importación y persistencia. Las pruebas de pantalla completa nativa y de reposo y reactivación físicos pasaron en el M1 Max utilizado.

<a id="source-material"></a>

## Material de origen

Esta página sigue el código de Paper en [`6ff7e17`](https://github.com/aindaco1/paper/tree/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95). Su contenido técnico se mantiene en [CHANGELOG.md](https://github.com/aindaco1/paper/blob/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95/CHANGELOG.md). Los detalles sobre los servicios de este sitio web se mantienen aquí.
