using Weave

concatenateFiles = true                                 # concatenate all notes to single file 

filenames = ["01-basics", "02-collections", "03-types" , 
              "04-project-errorprop"] # , "05-project-1DCA"]
notesDir = "notes/"
notebookDir = "notebooks/"

function cleanTemps(filename,notesDir;exts=[".out", ".log", ".aux"])
  for ext in exts
    rm(notesDir * filename * ext)
  end
end

function removeHeader(fileString)
  split(fileString,r"---")[end]
end

function concatFiles(filenames;writeout="./notes.jmd")
  # First file do not remove YAML header
  fileString = open(filenames[1]*".jmd") do file
    read(file, String)
  end
  
  for filename in filenames[2:end]
    file = filename * ".jmd"                              # file = filename + extension 
    s = open(file) do file
      read(file, String)
    end
    s = removeHeader(s)
    fileString *= s
  end
  open(writeout, "w") do f
      write(f, fileString)
  end
end

if concatenateFiles
  concatFiles(filenames);
  weave("notes.jmd"; doctype="md2pdf",
  out_path = notesDir)                            # weaving note

  # cleanTemps("notes",notesDir)                         # removing ugly .tex perifery
  # for filename in filenames
  #   # Basics
  #   println("Building $(filename)...")
  #   file = filename * ".jmd"                              # file = filename + extension
  #   convert_doc(file, notebookDir * filename * ".ipynb")  # weaving notebooks
  # end
else
  for filename in filenames
    # Basics
    println("Building $(filename)...")
    file = filename * ".jmd"                              # file = filename + extension

    weave(file; doctype="md2pdf",
          out_path = notesDir)                            # weaving notes
    cleanTemps(filename,notesDir)                         # removing ugly .tex perifery
    convert_doc(file, notebookDir * filename * ".ipynb")  # weaving notebooks
  end
end