using Weave

filename1 = "basics"


function cleanTemps(filename;exts=[".out", ".log", ".aux", ".pdf"])
  for ext in exts
    rm(filename1 * ext)
  end
end

# Basics
println("Building 'Basics'...")
weave(filename1 * ".jmd", doctype="md2pdf")
cp(filename1 * ".pdf", "notes/" * filename1 * ".pdf"; force=true)
cleanTemps(filename1)