//
// Author: F. Bisetti
// Date: 11/18/2021
//

// Define Mesh.MeshSizeMax to set the size, defined as the length of the triangle side,
// of the triangles on the object surface.
// Note that the units are meters because the STEP geometry will be
// converted to meters

// Import STL mesh
Merge "Xwing.stl";

// Create a surface from triangulated mesh
Surface Loop(1) = {1};
Surface(1) = {1};

Geometry.Synchronize();

// Export as STEP
Save "output_model.step";


Mesh.MeshSizeMax = 0.0001; // m

// The OpenCASCADE geometry kernel allows to import STEP files and to modify
// them. In this tutorial we will load a STEP geometry and partition it into
// slices.

SetFactory("OpenCASCADE");

// OpenCASCADE converts the units to
// meters (instead of the default, which is millimeters).

Geometry.OCCTargetUnit = "M";

// Load a STEP file (using `ShapeFromFile' instead of `Merge' allows to directly
// retrieve the tags of the highest dimensional imported entities):

v() = ShapeFromFile("output_model.step");

Mesh 2;

Mesh.Format = 27; // format code corresponds to STL 
Mesh.Binary =  1; // save binary whenever possible
Save 'shuttle.stl';
