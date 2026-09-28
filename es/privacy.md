---
title: Privacidad
description: Privacidad de Paper, la app gratuita y de código abierto para macOS.
lang: es
source_commit: 6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95
generated: true
layout: page
permalink: /es/privacy/
nav_exclude: true
---
<a id="privacy-and-diagnostics"></a>

# Privacidad y diagnóstico

Paper genera mosaicos de textura localmente. No captura pantallas, instala event taps, ajusta la gamma ni envía telemetría. Las recetas, los aspectos y las reglas de visibilidad se quedan en el Mac. La búsqueda de ciudades envía la ciudad escrita al servicio de geocodificación de Apple.

Sparkle consulta el feed oficial de versiones en GitHub al iniciar y periódicamente si las comprobaciones automáticas están activadas. Puedes desactivarlas en Settings y seguir comprobando a mano. La instalación requiere tu intervención. El perfilado del sistema y la instalación automática están desactivados. Las conexiones revelan los metadatos habituales al proveedor; Paper no añade un identificador de dispositivo.

**Help & diagnostics** muestra el JSON exacto que se enviaría. Solo incluye versiones numéricas de la app, compilación y sistema, arquitectura, estado general de textura, energía y horarios, intensidad aproximada, cantidades acotadas de pantallas y las últimas 20 categorías de eventos. Esas categorías no incluyen mensajes arbitrarios. Los informes excluyen rutas, nombres e identificadores de apps, identificadores de pantallas, ciudad, nombres y contenido de recetas, aspectos guardados, credenciales, símbolos de la pila, informes originales de fallos y variables de entorno. Las preferencias locales de Paper guardan un registro acotado y un informe filtrado pendiente. Su identificador sirve para reintentar el envío; no identifica a una persona o dispositivo.

**Import crash log** admite un archivo `.ips` de Paper seleccionado por ti, de hasta 2 MB. El analizador nativo compartido comprueba la identidad del producto y conserva únicamente campos permitidos de excepción, señal e imagen, un desplazamiento acotado dentro de la imagen y las versiones del incidente. La agrupación depende de la compilación y del sistema del incidente; cambiar los ajustes actuales no divide fallos idénticos. El informe original se queda en tu equipo.

**Send to public GitHub issues** es una acción explícita. Envía el informe mostrado, de hasta 8 KiB, por HTTPS a `https://crash.dustwave.xyz/v1/paper/reports`. El relay existente conserva las credenciales de GitHub y solo crea o actualiza issues en `aindaco1/paper`. Las huellas equivalentes comparten issue. Los reintentos conservan su identificador y no aumentan dos veces el contador dentro del periodo limitado de retención de recibos. Abrir la ventana, importar un fallo o guardar JSON no sube nada. No se envía un informe automáticamente después de un fallo.

El transporte rechaza redirecciones, respuestas demasiado grandes y confirmaciones que no coincidan. Puedes reintentar los envíos fallidos o sin confirmar. Los issues de GitHub son públicos; usa el [canal privado de seguridad](https://github.com/aindaco1/paper/blob/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95/SECURITY.md) para vulnerabilidades. Los límites por IP del relay usan metadatos de conexión para prevenir abusos, nunca como contenido del issue. Los contadores representan envíos, no usuarios únicos ni causas demostradas.

Los perfiles de escritorio, asignaciones de aspectos a apps, atajos, intensidades recordadas, geometría de la franja de lectura y ajustes de lámpara permanecen en las preferencias locales. No se añaden a los informes. Las pausas de presentación y batería baja usan las categorías generales de pausa y batería del esquema desplegado. La franja de lectura tiene una geometría que eliges tú; no sigue el puntero ni analiza la pantalla. El coordinador de instancia única solo acepta una petición para mostrar Settings; no tiene un protocolo remoto de configuración, apertura de archivos o ejecución de comandos.

<a id="this-website"></a>

## Este sitio web

El sitio de Paper es estático y está alojado en GitHub Pages; Cloudflare gestiona el DNS. No incluye scripts de analítica, publicidad, inicio de sesión ni cookies de marketing. Los proveedores de alojamiento reciben los metadatos habituales de conexión. La búsqueda de documentación funciona en tu navegador. La muestra de texturas no guarda ajustes ni sube nada.

Los enlaces de apoyo opcional abren el pago alojado en Stripe. Stripe gestiona los pagos y las aportaciones periódicas, no este sitio. GitHub aloja las descargas y el código. Consulta las políticas de [GitHub](https://docs.github.com/en/site-policy/privacy-policies/github-general-privacy-statement), [Cloudflare](https://www.cloudflare.com/privacypolicy/) y [Stripe](https://stripe.com/privacy).

<a id="source-material"></a>

## Material de origen

Esta página sigue el código de Paper en [`6ff7e17`](https://github.com/aindaco1/paper/tree/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95). Su contenido técnico se mantiene en [docs/privacy.md](https://github.com/aindaco1/paper/blob/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95/docs/privacy.md). Los detalles sobre los servicios de este sitio web se mantienen aquí.
