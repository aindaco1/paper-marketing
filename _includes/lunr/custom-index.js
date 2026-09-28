// Keep the theme's search behavior, indexing only the current language.
if (docs[i].relUrl.startsWith('/es/') !== (document.documentElement.lang === 'es')) continue;
