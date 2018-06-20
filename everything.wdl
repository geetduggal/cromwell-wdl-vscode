task everything {
  File infile

  command {
    python /script.py ${infile} > out.txt
  }

 output {
    File out = "out.txt"
 }

 runtime {
   docker: "geetduggal/testimg:0.1"
   cpu: 1
   memory: "512 MB"
 }
}

workflow all {
  File infile
  call everything {input: infile=infile }
  output{ File out = everything.out }
}