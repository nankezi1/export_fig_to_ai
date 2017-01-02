author: Niels Schroeter, Oxford University, please send bug reports to niels.bm.schroeter@gmail.com

This project provides an easy way to export .fig files to adobe illustrator

*INSTALLATION*
1. Add the program folder to your matlab path
2. copy the Import_from_matlab.jsx file to your adobe illustrator script folder, e.g."C:\Program Files\Adobe\Adobe Illustrator CC 2015\Presets\en_GB\Scripts" 
3. restart Illustrator to be able to call the script from File-->Scripts-->Import_from_matlab

*OPERATION AND USE*

The projects consists of two parts:
A) The export_fig_to_ai gui to export the figure from matlab to the hard drive
B) The Import_from_matlab.jsx javascript to load the fig into adobe illustrator

There are two steps for the export

1. The export from matlab 
a) Open the export_fig_to_ai gui and the figure you want to export (currently, NO SUBPLOTS are supported). 
b) Click on the figure you want to export to make it the current figure. 
c) Choose a filename and click the "export" pushbutton in the gui.

export_fig_to_ai will generate two files of the current matlab figure in the current folder
-filename.tiff file, which contains only the axis and false-color plots of the figure, but none of the line objects or contour plots
-filname.pdf, which contains only vector graphic elements (axis, lines, contours), but no false-color plots

2. The import into illustrator 
a) Open adobe illustrator after installation of Import_from_matlab.jsx 
b) go to File-->Scripts-->Import_from_matlab to start the script
c) select BOTH the filename.pdf and filename.tiff files.

Now the script will merge the filename.tiff into the filename.pdf, such that the resulting figure is properly ordered.

You can now change some details, then select all objects and group them to copy them into another .ai file.


*CURRENTLY KNOW LIMITATIONS*

-export_fig_to_ai gui only works with figures that don't have subplots
-there is still a tiny offset between the .tiff file and the vector graphic in the .pdf file after merging
