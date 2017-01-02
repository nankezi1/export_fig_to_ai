
var docs = File.openDialog("Select Files to Open",true);  
var docPdf=app.open(docs[0]); 
var docTif=app.open(docs[1]); 

docPdf.layers[0].pageItems[docPdf.layers[0].pageItems.length-1].remove(); //~clean the exported pdf of the last layer
docPdf.layers[0].pageItems[docPdf.layers[0].pageItems.length-1].remove(); //~clean the exported pdf of the last layer

var tif_copy=docTif.pageItems[0].duplicate(docPdf, ElementPlacement.PLACEATEND); //~copy tif to pdf and place at the bottom of the layer
var tif_mask=docPdf.layers[0].pageItems[docPdf.layers[0].pageItems.length-2];

var group =docPdf.groupItems.add();//~open new group that will become clipping group
tif_copy.moveToBeginning(group); //~move last two items into group
tif_mask.moveToBeginning(group); 
group.clipped = true;
group.zOrder( ZOrderMethod.SENDTOBACK );

app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);  