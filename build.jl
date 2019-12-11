using Weave

filenames = ["basics","collections"]
notesDir = "notes/"
notebookDir = "notebooks/"


function cleanTemps(filename,notesDir;exts=[".out", ".log", ".aux"])
  for ext in exts
    rm(notesDir * filename * ext)
  end
end

for filename in filenames
  # Basics
  println("Building $(filename)...")
  file = filename * ".jmd"                              # file = filename + extension

  weave(file; doctype="md2pdf",
        out_path = notesDir)                            # weaving notes
  cleanTemps(filename,notesDir)                         # removing ugly .tex perifery
  convert_doc(file, notebookDir * filename * ".ipynb")  # weaving notebooks
end
