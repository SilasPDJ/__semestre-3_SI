Attribute VB_Name = "NewMacros"
Sub criarObjeto()
Attribute criarObjeto.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.criarObjeto"
'
' criarObjeto Macro
'
'
    Selection.InlineShapes.AddOLEObject ClassType:="Word.Document.12", _
        FileName:="", LinkToFile:=False, DisplayAsIcon:=False
    Selection.PasteAndFormat (wdFormatOriginalFormatting)
End Sub
