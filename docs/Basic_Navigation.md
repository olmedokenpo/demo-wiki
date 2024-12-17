# Basic Navigation

This section describes the key elements of the interface and basic tools to interact with the application.

---

## 1. Symbols
Each element and action in the application has a unique symbol to facilitate quick identification. Below are the main symbols used:

| Symbol               | Description                           |
|----------------------|---------------------------------------|
| ![Sidebar](images/antenna.png){:height="30px" width="30px"}  | Sidebar |
| ![Antenna](images/antenna.png){:height="30px" width="30px"}         | Antenna |
| ![Height Area](images/antenna.png){:height="30px" width="30px"} | Height Area |
| ![Line](images/antenna.png){:height="30px" width="30px"}             | Line |




> **Note:** The colors of the elements on the map also represent their status:
- **Blue**: Data is loading.
- **Yellow**: Data received partially.
- **Red**: Error loading data.

---

## 2. Objects
The application handles different types of objects, each with specific attributes and functions. These objects are displayed on the map and can be edited.

- **Point**: Represents a location on the map.  
  Attributes: Latitude, Longitude.

- **Area**: Defined by two points (top-left and bottom-right corner).  
  Attributes: Coordinates, area type.

- **Line**: Represents a connection between two points and can display data such as graphs.  
  Attributes: Start and end coordinates.

- **Antenna**: Located at a point, represents a signal transmitter.  
  Attributes: Frequency, Height, Signal loss algorithm.

---

## 3. Interface Elements

### 3.1. Sidebar
- Displays detailed information of objects on the map.
- Contains buttons to edit or delete objects.

### 3.2. Pop-ups
- Appear when selecting an object on the map.
- Show the same information as the sidebar, but only for the selected item.
- Include buttons to interact with the object.

### 3.3. Layers
- Allow toggling the visibility of different types of objects (antennas, lines, areas).
- Divided into:
  - **Current Layer**: Visible and active elements on the map.
  - **Dynamic Layers**: Supplementary information that overlays.

---

## 4. Toolbar
The toolbar facilitates the creation and modification of elements on the map.

### Main tools:
- **Create Antenna**: Places an antenna.
- **Create Area**: Defines areas for heights or signal loss calculations.
- **Create Line**: Draws a line between two points.
- **Clear All**: Deletes all elements from the map.
- **Cancel Action**: Stops any ongoing action.

---

## 5. Legend
The legend explains the colors used on the map to represent the data of the objects.

### Types of legends:
- **Signal Loss**: A color gradient (blue to pink) indicating decibels.
- **Heights**: Cyclic colors representing 1000-meter intervals.

---

## 6. Navigation Panel
- **Scale**: Provides a reference for the size of the elements on the map.
- **Cursor Position**: Shows the current coordinates (latitude and longitude).

---

## 7. Forms
Forms allow editing attributes of existing objects or creating new ones.

### Types of forms:
1. **Antenna Form**:
   - Frequency, Height, Position.
2. **Area Form**:
   - Coordinates, Algorithm Type.
3. **Optimization Form**:
   - Genetic algorithm configuration (population, generations, uniformity).

---

## 8. Optimization Settings
Optimizations use genetic algorithms to search for maxima or minima of a variable.

### Main parameters:
- **Population**: Number of individuals per generation.
- **Generations**: Total number of generations to simulate.
- **Uniformity**: Controls mutation rate to optimize accuracy.
- **Selection Type**:
  - Elite: Only the best individuals continue.
  - Roulette: Probability based on scores.
  - Tournament: Competition between pairs of individuals.

> **Note:** Proper configuration significantly improves the optimization performance.

---
