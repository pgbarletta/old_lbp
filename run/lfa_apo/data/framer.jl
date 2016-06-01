#! /usr/bin/julia

# Seteo la carpeta de destino, la trayectoria de la q voy a sacar los frames, la topología y luego
# los nombres de los distintos cpptraj q voy a escribir y los pdbs q voy a sacar
nc_file  = string("/home/german/labo/16/lbp/run/lfa_apo/data/lfa_apo_90000.nc")
folder_frames  = string("/home/german/labo/16/lbp/run/lfa_apo/data/frames")
prmtop_file = string("/home/german/labo/16/lbp/top_files/dry_lfa_apo.prmtop")

for i=0:10:90000
    if i == 0
        i = 1
    end
    cpptraj_in_file = string("/home/german/labo/16/lbp/run/lfa_apo/data/", i,"_framer_in_cpp")
    pdb_file  = string("/home/german/labo/16/lbp/run/lfa_apo/data/", i,"frame_lfa_apo.pdb")

    cpptraj_in =open(cpptraj_in_file, "w")
    write(cpptraj_in, "parm ", prmtop_file, "\n")
    write(cpptraj_in, string("trajin ", nc_file, " ", i, " ", i," 1", "\n"))
    write(cpptraj_in, string("trajout ", pdb_file, "\n"))
    write(cpptraj_in, string("run", "\n"))
    close(cpptraj_in)

    run(`cpptraj -i $cpptraj_in_file`);
    run(`rm $cpptraj_in_file`)
    run(`mv $pdb_file $folder_frames`)
end
