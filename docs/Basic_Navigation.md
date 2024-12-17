# Diseño de la Librería

- [Arquitectura](#arquitectura)
- [Análisis de Sintaxis](#analisis-de-sintaxis)
- [Estructuras de Datos](#estructuras-de-datos)
- [Tipos Enumerados](#tipos-enumerados)
- [Dependencias Externas](#dependencias-externas)
- [Dependencia GLFW](#dependencia-glfw)
- _Dependencia libc_
- [Plataformas y Gráficos](#plataformas-y-graficos)
- [Sistema de Entrada](#sistema-de-entrada)
- [Shader Predeterminado](#shader-predeterminado)
- [Shaders Personalizados](#shaders-personalizados)
- [Convenciones de Código](#convenciones-de-codigo)
- [Integración con Otras Librerías](#integracion-con-otras-librerias)

# Plataformas de Desarrollo

- [Trabajo en Windows](#trabajo-en-windows)
- [Trabajo en macOS](#trabajo-en-macos)
- [Trabajo en GNU Linux](#trabajo-en-gnu-linux)
- [Trabajo en Chrome OS](#trabajo-en-chrome-os)
- [Trabajo en FreeBSD](#trabajo-en-freebsd)
- [Trabajo en Raspberry Pi](#trabajo-en-raspberry-pi)

---

## Elementos de la Interfaz

### Barra Lateral
- Muestra información detallada de los objetos en el mapa.
- Contiene botones para editar o eliminar objetos.

### Ventanas Emergentes
- Aparecen al seleccionar un objeto en el mapa.
- Muestran la misma información que la barra lateral, pero solo del objeto seleccionado.
- Incluyen botones para interactuar con el objeto.

### Capas
- Permiten alternar la visibilidad de diferentes objetos:
  - **Capa Actual**: Elementos visibles y activos en el mapa.
  - **Capas Dinámicas**: Información complementaria superpuesta.

---

## Configuración de Optimización

- **Población**: Número de individuos por generación.
- **Generaciones**: Total de generaciones a simular.
- **Uniformidad**: Controla la tasa de mutación para mejorar precisión.
- **Tipo de Selección**:
  - Elite
  - Ruleta
  - Torneo
