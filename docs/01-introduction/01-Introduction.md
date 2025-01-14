
Propamap is an advanced web application designed to assist users in propagation loss analysis and antenna positioning optimization. This user manual provides a detailed guide for operating the tool, highlighting its key features and integrated modules that enable precise and detailed analyses.

## General Features

Propamap offers an intuitive, map-based interface that allows users to navigate and select specific areas anywhere in the world. The tool is tailored to address communication challenges and similar applications, providing support for real-world scenarios with exceptional precision and detail.

### Main Modules

Propamap includes two main modules for propagation analysis and antenna positioning:

#### **2D Propagation Planner**

This module focuses on 2D analysis and features the following submodules:

- **Coverage Planning Tool:** Enables propagation loss analysis and coverage planning by positioning antennas in specific areas.
- **Terrain Elevation Analyzer:** Analyzes terrain elevations, providing critical insights to optimize antenna placement.

#### **3D Ray Tracing Planner**

This advanced module leverages ray tracing techniques to simulate radio frequency propagation in three-dimensional environments. It is a powerful tool for:

- Conducting detailed propagation loss analyses in complex scenarios.
- Optimizing antenna positioning for communication applications.

Both modules operate in real-world scenarios, allowing users to select any area on the planet to perform detailed and precise analyses. This makes Propamap an essential tool for addressing challenges related to coverage and propagation in communication systems.

Explore the sections of this manual to learn how to use each functionality and maximize the capabilities of Propamap.

























Propamat es una aplicación web diseñada para facilitar el análisis de pérdidas de propagación y la optimización de la ubicación de antenas. Su interfaz principal, intuitiva y basada en mapas, permite a los usuarios seleccionar y configurar áreas específicas para el análisis. Además, la herramienta admite la entrada manual de coordenadas, lo que mejora la precisión de los resultados obtenidos.

![Ventana principal de la aplicación](graphics/main_application_window.png)

## Funcionalidades Principales

La interfaz gráfica incluye una variedad de herramientas que simplifican el proceso de análisis:

- **Selección de áreas:**
  - Utiliza herramientas como rectángulos, polilíneas, polígonos o rutas para definir la zona de interés.
  - Permite mover, editar o eliminar elementos seleccionados.
- **Gestión de antenas:**
  - Añade antenas a las áreas seleccionadas para realizar cálculos de pérdidas de propagación.
  - Configura parámetros específicos mediante ventanas modales interactivas.

Una vez seleccionada el área, los usuarios pueden llevar a cabo análisis detallados utilizando los modelos de propagación integrados en la aplicación. Estos modelos, al ser configurados, envían solicitudes a un servidor de propagación que calcula las pérdidas asociadas. Con estos resultados, se puede optimizar la ubicación de las antenas mediante un algoritmo genético, mejorando la cobertura de servicios de comunicación en el área seleccionada.

![Componentes de la interfaz gráfica](graphics/main_application_window_component.png)

## Ejemplo de Uso: Análisis en Alcalá de Henares

Para ilustrar las capacidades de Propamat, se ha seleccionado un área en Alcalá de Henares, España. En este ejemplo, se realiza un análisis de pérdidas de propagación y se optimiza la posición de antenas transmisoras. 

### Configuración Inicial:
- **Antena transmisora base:**
  - Frecuencia: 1000 MHz
  - Altura: 30 metros
- **Antena transmisora a optimizar:**
  - Configuración inicial idéntica a la base
  - Optimización de posición basada en cálculos de pérdidas de propagación
- **Antenas receptoras:**
  - Altura fija: 2 metros

> Nota: En el modelo ECC, la altura de las estaciones móviles se establece en 5 metros. En el modelo Sui, las antenas transmisoras se configuran a una frecuencia de 1900 MHz debido a las limitaciones de frecuencia.

![Área seleccionada](graphics/selected_area_3.png)

## Resultados

Los resultados obtenidos muestran las pérdidas promedio en distintos entornos, según los modelos seleccionados. Es importante destacar que algunos modelos, como FSPL y Egli, no dependen del entorno, lo que se refleja en la consistencia de sus resultados.

Consulta la tabla de comparación de modelos y los resultados detallados en las secciones correspondientes para un análisis más profundo.


| [Previous](#prev) | [Home](#home)     | [Next](#next) |
|-------------------|:-----------------:|--------------:|

