# Contribución a [Paso Pasifico]

¡Gracias por tu interés en contribuir a nuestro proyecto! Por favor, sigue estas pautas para garantizar un flujo de trabajo organizado y eficiente.
# Guía de Contribución: GitHub Flow

Este proyecto sigue **GitHub Flow** como flujo de trabajo. GitHub Flow es un proceso sencillo y eficaz que funciona bien para proyectos con despliegues frecuentes y ciclos de desarrollo ágiles.

## Flujo de Trabajo: GitHub Flow

### Rama Principal (`main`)

- La rama `main` contiene siempre el código más estable y listo para producción.
- Todos los cambios importantes (nuevas funcionalidades, correcciones de errores, mejoras, etc.) deben pasar por un proceso de Pull Request (PR) antes de fusionarse en `main`.

### Ramas de Características (`feature/mi-feature`)

- Cada nueva funcionalidad, corrección o mejora debe desarrollarse en una rama separada basada en `main`.
- Estas ramas suelen nombrarse `feature/mi-feature`, siguiendo la convención `feature/nombre-de-caracteristica`.
- Para crear una nueva rama de característica, utiliza el siguiente comando:
  ```bash
  git checkout -b feature/nombre-de-caracteristica main

## Flujo de Trabajo: GitHub Flow

Usar **GitHub Flow** para manejar el desarrollo de este proyecto. Aquí están los pasos para contribuir:

1. **Rama `main`**:
   - La rama `main` contiene el código más reciente y estable.
   - Solo se fusionan cambios aprobados y listos para producción en esta rama.

2. **Ramas de Características**:
   - Para cada nueva funcionalidad o corrección, crea una rama basada en `main` con el prefijo `feature/`.
   - El nombre de la rama debe describir la característica o corrección, usando la convención `feature/nombre-de-caracteristica`. Ejemplo: `feature/agregar-autenticacion`.

3. **Proceso de Pull Request (PR)**:
   - Una vez que termines los cambios en tu rama de característica, abre un Pull Request hacia `main`.
   - Asegúrate de que el título y la descripción del PR sean claros y específicos.
   - Solicita al menos una revisión de un colaborador del equipo.
   - Asegúrate de que todos los tests pasen antes de solicitar una revisión.

4. **Revisión y Aprobación**:
   - Todos los PR deben ser revisados y aprobados antes de fusionarse en `main`.
   - Cada PR debe tener al menos **una aprobación** de otro colaborador antes de poder fusionarse.

5. **Pruebas y Calidad de Código**:
   - Realiza pruebas en tu código antes de abrir un PR.
   - Sigue las convenciones de estilo de código del proyecto.

6. **Fusión a `main`**:
   - Una vez aprobado el PR y pasados todos los tests, fusiona los cambios en `main`.
   - El código en `main` debe estar listo para producción, así que asegúrate de que tus cambios estén completamente probados y revisados.

## Convenciones de Nombres para Ramas

- Ramas de características: `feature/nombre-de-caracteristica`
- Ramas de corrección de errores: `fix/nombre-de-correccion`
- Evita nombres genéricos como `actualizacion` o `cambios-varios`. Sé específico para facilitar la revisión y el historial de cambios.

## Ejemplo de Pull Request (PR)

- Título: `[Feature] Agregar autenticación de usuario`
- Descripción:
  - Descripción breve del cambio.
  - Detalles de la implementación.
  - Si aplica, explica los posibles impactos en otras partes del proyecto.

Siguiendo estos lineamientos, podremos mantener un flujo de trabajo ordenado y colaborativo. ¡Gracias por contribuir!