# Bienvenido a Paso Pacifico mobile app

A continuación, encontrarás las pautas y el flujo de trabajo que seguimos para garantizar un desarrollo organizado y eficiente.

## Guía de Contribución: GitHub Flow

Este proyecto sigue **GitHub Flow** como flujo de trabajo. GitHub Flow es un proceso sencillo y eficaz que funciona bien para proyectos con despliegues frecuentes y ciclos de desarrollo ágiles.

### Flujo de Trabajo: GitHub Flow

#### Rama Principal (`main`)

- La rama `main` contiene siempre el código más estable y listo para producción.
- Todos los cambios importantes (nuevas funcionalidades, correcciones de errores, mejoras, etc.) deben pasar por un proceso de Pull Request (PR) antes de fusionarse en `main`.

#### Ramas de Características (`feature/mi-feature`)

- Cada nueva funcionalidad, corrección o mejora debe desarrollarse en una rama separada basada en `main`.
- Estas ramas suelen nombrarse `feature/mi-feature`, siguiendo la convención `feature/nombre-de-caracteristica`.
- Para crear una nueva rama de característica, utiliza el siguiente comando:
  ```bash
  git checkout -b feature/nombre-de-caracteristica main
## Proceso de Pull Request (PR)

- Una vez que se haya completado el trabajo en la rama de característica, crea un **Pull Request (PR)** para revisar los cambios antes de fusionarlo en `main`.
- Asigna revisores al PR y espera su aprobación antes de proceder con la fusión.
- Asegúrate de que todos los tests pasen y que se cumplan los requisitos de revisión antes de fusionar.
-
## Ejemplo de Pull Request (PR)

- Título: `[Feature] Agregar autenticación de usuario`
- Descripción:
  - Descripción breve del cambio.
  - Detalles de la implementación.
  - Si aplica, explica los posibles impactos en otras partes del proyecto.
    
## Fusión a `main`

- Tras aprobar el PR, fusiona los cambios en `main`.

## Convenciones de Nombres

Para mantener la coherencia en el código, sigue las siguientes convenciones de nombres:

- **Variables**: Usa `camelCase` (ej., `miVariableEjemplo`).
- **Funciones**: Usa `camelCase` y nombres descriptivos (ej., `procesarDatos()`, `generarReporte()`).
- **Clases**: Usa `PascalCase` para clases y constructores (ej., `UsuarioController`, `ReporteAnual`).
- **Archivos**: Usa `kebab-case` para archivos y sigue la convención de la entidad principal en el archivo (ej., `usuario-controller.js`, `reporte-anual.md`).
- **Ramas**:
  - Características: `feature/nombre-de-caracteristica` (ej., `feature/agregar-autenticacion`).
  - Correcciones: `fix/nombre-de-correccion` (ej., `fix/error-validacion`).
- **Otros**: Evita nombres genéricos como `actualizacion` o `cambios-varios`. Usa nombres específicos para facilitar la revisión y el historial de cambios.

## Prácticas de Desarrollo

Sigue estas prácticas para contribuir de manera organizada y eficiente:

### Documentación

- Asegúrate de documentar cada función y clase de manera clara y concisa.
- Los comentarios deben explicar *qué* hace el código y *por qué* es necesario (no solo *cómo*).
- Agrega documentación detallada en módulos o componentes complejos.

### Formato de Commits

Usa mensajes de commit claros y específicos en inglés o español, siguiendo esta convención:


- **Tipos comunes**:
  - `feat`: Nueva funcionalidad.
  - `fix`: Corrección de errores.
  - `docs`: Cambios en la documentación.
  - `style`: Cambios de formato o estilo, sin afectar el funcionamiento.
  - `refactor`: Refactorización de código sin cambios funcionales.
- **Ejemplo**: `feat: agregar autenticación de usuario`

### Comentarios en el Código

- Usa comentarios descriptivos para secciones de código complejas.
- Coloca los comentarios en inglés o español y mantén un estilo claro y profesional.
- Evita comentarios innecesarios o redundantes (ej., no comentes variables evidentes).
